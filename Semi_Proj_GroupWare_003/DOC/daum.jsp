<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript" src="js/httpRequest.js"></script>
<script>
	function chkId() {
		var idv = document.getElementById("id").value;
		var url = "*.kosta?cmd=result&id=" + idv;
		sendRequest(url, null, res, "get");
	}
	function res() {
		if (xhr.readyState == 4) {
			if (xhr.status == 200) {
				var res = xhr.responseText;
				res = parseInt(res, 10);
				result(res);
			} else {
				alert("����" + xhr.status);
			}
		}
	}

	function result(num) {
		if (num == 1) {
			alert("�ߺ��� ���̵� �Դϴ�.");
		} else {
			alert("����ص� �Ǵ� ���̵� �Դϴ�.");
		}
	}

	function execDaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// �˾����� �˻���� �׸��� Ŭ�������� ������ �ڵ带 �ۼ��ϴ� �κ�.

						// ���θ� �ּ��� ���� ��Ģ�� ���� �ּҸ� �����Ѵ�.
						// �������� ������ ���� ���� ��쿣 ����('')���� �����Ƿ�, �̸� �����Ͽ� �б� �Ѵ�.
						var fullRoadAddr = data.roadAddress; // ���θ� �ּ� ����
						var extraRoadAddr = ''; // ���θ� ������ �ּ� ����

						// ���������� ���� ��� �߰��Ѵ�. (�������� ����)
						// �������� ��� ������ ���ڰ� "��/��/��"�� ������.
						if (data.bname !== '' && /[��|��|��]$/g.test(data.bname)) {
							extraRoadAddr += data.bname;
						}
						// �ǹ����� �ְ�, ���������� ��� �߰��Ѵ�.
						if (data.buildingName !== '' && data.apartment === 'Y') {
							extraRoadAddr += (extraRoadAddr !== '' ? ', '
									+ data.buildingName : data.buildingName);
						}
						// ���θ�, ���� ������ �ּҰ� ���� ���, ��ȣ���� �߰��� ���� ���ڿ��� �����.
						if (extraRoadAddr !== '') {
							extraRoadAddr = ' (' + extraRoadAddr + ')';
						}
						// ���θ�, ���� �ּ��� ������ ���� �ش� ������ �ּҸ� �߰��Ѵ�.
						if (fullRoadAddr !== '') {
							fullRoadAddr += extraRoadAddr;
						}

						// �����ȣ�� �ּ� ������ �ش� �ʵ忡 �ִ´�.
						document.getElementById('post').value = data.zonecode; //5�ڸ� �������ȣ ���
						document.getElementById('roadAddress').value = fullRoadAddr;
						document.getElementById('jibunAddress').value = data.jibunAddress;

						// ����ڰ� '���� ����'�� Ŭ���� ���, ���� �ּҶ�� ǥ�ø� ���ش�.
						if (data.autoRoadAddress) {
							//����Ǵ� ���θ� �ּҿ� ������ �ּҸ� �߰��Ѵ�.
							var expRoadAddr = data.autoRoadAddress
									+ extraRoadAddr;
							document.getElementById('guide').innerHTML = '(���� ���θ� �ּ� : '
									+ expRoadAddr + ')';

						} else if (data.autoJibunAddress) {
							var expJibunAddr = data.autoJibunAddress;
							document.getElementById('guide').innerHTML = '(���� ���� �ּ� : '
									+ expJibunAddr + ')';

						} else {
							document.getElementById('guide').innerHTML = '';
						}
					}
				}).open();
	}
</script>
</head>
<body>
	<div id="wrap">
		<form method="post" action="*.kosta">
			<input type="hidden" name="cmd" value="memadd">
			<table>
				<tr>
					<td>���̵�</td>
					<!--  select count(*) cnt from mem where id=?
								IdCheckAction���� ���̵���
								request�� �޾Ƽ�
								MemDao�� ������ ��
								public int findID(String id) {
								select count(*) cnt from mem where id=?
								.........
								}
								��ȯ�� ���� idchkRes.jsp��
								1�̸� �����մϴ�. 0�̸� ��밡���մϴٷ� ǥ���ϰ��ϰ�
								�� ���� Ajax�� callback����
								div�� ���̵� res�� �����ؼ� ����ϸ� �� -->
					<td><input type="text" name="id" id="id"> <input
						type="button" value="�ߺ�üũ" onclick="chkId()">
						<div id=res></div></td>
				</tr>
				<tr>
					<td>��й�ȣ</td>
					<td><input type="password" name="pwd" id="pwd"></td>
				</tr>
				<tr>
					<td>�̸�</td>
					<td><input type="text" name="name" id="name"></td>
				</tr>
				<tr>
					<td>�����ȣ</td>
					<td><input type="text" id="post" name="post"
						placeholder="�����ȣ"> <input type="button"
						onclick="execDaumPostcode()" value="�����ȣ ã��"><br></td>
				</tr>
				<tr>
				<tr>
					<td>�ּ�</td>
					<td><input type="text" id="roadAddress" name="roadAddress"
						placeholder="���θ��ּ�"> <input type="text" id="jibunAddress"
						name="jibunAddress" placeholder="�����ּ�"> <span id="guide"
						style="color: #999"></span></td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit" value="����"></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>