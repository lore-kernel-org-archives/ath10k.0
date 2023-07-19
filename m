Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E67FEEB64DA
	for <ath10k@archiver.kernel.org>; Wed, 19 Jul 2023 06:47:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:From:To:
	Subject:Content-Description:MIME-Version:Cc:Content-ID:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=zrKNi4YidabcjCEky/SavV6Zg9bLgU8/D7GumLx34LQ=; b=ZQi
	4ybwCBL14u56Bb114a4LnTg3ZsJlBDtkX+ZNdbFjFrkpUncXaBbntvKXGLigctSxmjld+OI7v4A/J
	Veyzq6wTsdmd6idmIdcNuP3fG1yU3nkfb9UZyLltAL1+1csJav1OiVdCoVL9ZMmLIc4DcYAXYUo6q
	K8P3/65paVTmgYBPwfesQlxk/x5lX1VJ7FpT+v3cvojT7JxVe3LQGarNFQRngJSrtbrtPJ2/u6DSd
	lWPhj7YLD+jw5H674wkbiGsQ3dq3RLB399gn4SZnUz+HZYfgktgcOJmhDZKFFmPby9C6LMGpNUVZJ
	q1KEXLYUoLF0iYYUKx5Q27i/J/2B9Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM0y7-005tcI-0w;
	Wed, 19 Jul 2023 06:47:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM0y3-005tYo-0i
	for ath10k@bombadil.infradead.org;
	Wed, 19 Jul 2023 06:47:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Message-Id:Reply-To:Date:From:To:
	Subject:Content-Description:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Sender:Cc:Content-ID:In-Reply-To:References;
	bh=Aor/WLwl4h5zbhGzya8ajVmHiT+79UPpoXAPFDddDh4=; b=Z3jj/S73JkOedZVQXCEbPcUAJo
	GncwzXOlEgB824EZCseP8JGXGtyXvny60l0frIrfoiTAG91OYVHd33IdNjTFziWozw7wz0dBqt4sO
	LoTNz/RAMLj7hKVH1vqho3Ufy4ypQVc9MBC6+ZbwilyKIUVxaNiDjcjzfPocfmzEFv5n0TBk/Uhvx
	Y6XVotGQrA7eK8C+qsyc8Y/cs1oeXvfU/cnLk7yRiqZGkN0Ob1V8HEyNYXZj6bz8DuNFELWtw0giF
	6h3frut3vxCaGLUKi3GoTG27TiRm1DBUTKxzcVri0b+1IQqOi4hIIBoYNit6tnHEM3sqNkUJbjAzT
	E0PCCKVw==;
Received: from mail.maracanau.ce.gov.br ([187.86.206.254])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLujB-00CGRc-1c
	for ath10k@lists.infradead.org;
	Wed, 19 Jul 2023 00:07:42 +0000
Received: from localhost (localhost [127.0.0.1])
	by mail.maracanau.ce.gov.br (Postfix) with ESMTP id 56F53B09822
	for <ath10k@lists.infradead.org>; Tue, 18 Jul 2023 21:07:35 -0300 (-03)
Received: from mail.maracanau.ce.gov.br ([127.0.0.1])
	by localhost (mail.maracanau.ce.gov.br [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id AvpvjPwelIwY for <ath10k@lists.infradead.org>;
	Tue, 18 Jul 2023 21:07:35 -0300 (-03)
Received: from localhost (localhost [127.0.0.1])
	by mail.maracanau.ce.gov.br (Postfix) with ESMTP id 2AE0DB097CA
	for <ath10k@lists.infradead.org>; Tue, 18 Jul 2023 21:07:35 -0300 (-03)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.maracanau.ce.gov.br 2AE0DB097CA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=maracanau.ce.gov.br;
	s=5B33696C-FA0D-11EC-880A-860953C84890; t=1689725255;
	bh=Aor/WLwl4h5zbhGzya8ajVmHiT+79UPpoXAPFDddDh4=;
	h=MIME-Version:To:From:Date:Message-Id;
	b=Jy3I6TR5iaO22tWL+/gDk/QnBRhUjKUcFjwwOvdiPZAH4jPFUcMa+fF/8/jrN5F/q
	 k0XZipO+Wl13fkf8541cKIa2hKH3TvxqXqkwRyYXZP23k7+VQi678+bAdkd5Dopsug
	 HsXhhzaHGEK34exXwI2wJh/eIR68x/kmAD1E27K3Wo3yyKvmD4cGKIYqMmmide6X72
	 R4YutsDpgORZhHYR96DhQyYmuNP0sooswAiOMCx96oOSX/+LG0eoS+lq0pqJkH54L8
	 i2Ie73tLfF4sibFnALs9R/dagxLy5oVn3V1yER/6opj0TS3yGJW/t3ocaCIL233rIX
	 X5esIDVVgeyow==
X-Virus-Scanned: amavisd-new at maracanau.ce.gov.br
Received: from mail.maracanau.ce.gov.br ([127.0.0.1])
	by localhost (mail.maracanau.ce.gov.br [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 46po5shHblkP for <ath10k@lists.infradead.org>;
	Tue, 18 Jul 2023 21:07:35 -0300 (-03)
Received: from [192.168.0.166] (unknown [105.8.1.58])
	by mail.maracanau.ce.gov.br (Postfix) with ESMTPSA id 547D1B0982A
	for <ath10k@lists.infradead.org>; Tue, 18 Jul 2023 21:07:33 -0300 (-03)
MIME-Version: 1.0
Content-Description: Mail message body
Subject: =?utf-8?b?RHVsZcW+aXTDoSB6cHLDoXZhOyDigqwgMiwwMDAsMDAwJzAwIEVVUg==?=
To: ath10k@lists.infradead.org
From: "Pan Richard Wahl" <coordenadoriasdp_camara@maracanau.ce.gov.br>
Date: Tue, 18 Jul 2023 17:07:26 -0700
Message-Id: <20230719000734.547D1B0982A@mail.maracanau.ce.gov.br>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230719_010740_453330_3FD654A1 
X-CRM114-Status: UNSURE (  -2.45  )
X-CRM114-Notice: Please train this message.
X-BeenThere: ath10k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Reply-To: info@wahlfoundation.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

RHJhaMO9IHByw610ZWxpLAoKSnNlbSBwYW4gUmljaGFyZCBXYWhsLCBtZWdhIHbDrXRleiA1MzMg
bWlsaW9udSAkIHYgamFja3BvdHUgTWVnYSBNaWxsaW9ucy4gRGFydWppIDUgbsOhaG9kbmUgdnli
cmFuw71tIGxpZGVtLiBQb2t1ZCBvYmRyxb7DrXRlIHRlbnRvIGUtbWFpbCwgYnlsIHbDocWhIGUt
bWFpbCB2eWJyw6FuIHBvIHJvenRvY2Vuw60ga291bGUuIFZldMWhaW51IHN2w6lobyBtYWpldGt1
IGpzZW0gcm96ZGFsIHJhZGUgY2hhcml0YXRpdm7DrWNoIG9yZ2FuaXphY8OtIGEgb3JnYW5pemFj
w60uIERvYnJvdm9sbmUganNlbSBzZSByb3pob2RsIHZlbm92YXQgdsOhbSBjw6FzdGt1IOKCrCAy
LDAwMCwwMDAnMDAgRVVSIGpha28gamVkbm9tdSB6IDUgdnlicmFuw71jaCwgYWJ5Y2ggc2kgb3Zl
cmlsIHN2w6kgdsO9aHJ5IHByb3N0cmVkbmljdHbDrW0gbsOtxb5lIHV2ZWRlbsOpIHN0csOhbmt5
IFlvdVR1YmUuCgpWSUTDjVRFIE1FIFpERSBodHRwczovL3d3dy55b3V0dWJlLmNvbS93YXRjaD92
PXRuZTAyRXhORHJ3CgpUT1RPIEpFIFbDgcWgIERBUk9WQUPDjSBLw5NEOiBbREZEVzQzMDM0Ulcy
MDIzXQoKT2Rwb3ZlenRlIG5hIHRlbnRvIGUtbWFpbCBhIHV2ZWR0ZSBrw7NkIGRhcnU6IGluZm9A
d2FobGZvdW5kYXRpb24ub3JnCgpEb3Vmw6FtLCDFvmUgdsOhbSBhIHZhxaHDrSByb2RpbmUgdWRl
bMOhbSByYWRvc3QuCgpQb3pkcmF2eSwKUGFuIFJpY2hhcmQgV2FobAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYXRoMTBrIG1haWxpbmcgbGlzdAphdGgx
MGtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2F0aDEwawo=
