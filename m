Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A326CCAC5A0
	for <ath10k@archiver.kernel.org>; Sat, 20 Sep 2025 04:00:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:Date:Subject:To:From:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=GlFWriZ41w2rQfdX5zu8V6cJmXl7Vux1SM97RqZRIsY=; b=eqAyLyVQJ1If0c
	m4t3Pf4UaPk3iTahHe9pC4sb1jW0mqjmPXjsjiOQNw+UIt2y9RTlw3JCjW4HD887miqho3A/yohwh
	J8NaaFt7hFW0n1aPZ2Xu54sbCynZE9VUtqwI8TKCzxgVzpNCyHToFdjvSisbTIgwWryEjQUrY1VQT
	HOBuY5sm7s7eh4lEESDk4/N87cNsU4LDMhDHCfoMvAv19SHL0DV4nI4NRaWbFhiVSPrKw89bWN4f4
	7XKdtJCDkqguktgr7G3UOEinDyKv5L4kCaWWQkoJB7yH81GspdKjIBgx+elpCpCKklAbbBlkot6N2
	yw4CVUAI8vOXoYlTdaZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzoln-00000004h91-1PxU;
	Sat, 20 Sep 2025 04:00:19 +0000
Received: from sender4-pp-o95.zoho.com ([136.143.188.95])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzoll-00000004h8b-1NUy
	for ath10k@lists.infradead.org;
	Sat, 20 Sep 2025 04:00:18 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1758340812; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=io8YHZEEJGBLu6EtdoFrCsw+tRLcockYAeV7EzO7R9lpTBZrg0egNV6VKH7aW25AE0UOn5aYQOsYcwt2QePGuKHQX/26y2gT4TQcc0ec9BXGQgak66kD6ag7/pAHaR6vPlEk+hg1q2usmOnm2qXnOsBGNYJh1n8a6PSw+x32n+k=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1758340812; h=Content-Type:Content-Transfer-Encoding:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To:Cc; 
	bh=GlFWriZ41w2rQfdX5zu8V6cJmXl7Vux1SM97RqZRIsY=; 
	b=MaOII32mQ16Mn/I/DCohrEvGmbC8P9yAJJp1huFRRb3DLF8Lhe76/6xuETrPgxa6rKFnSnNz2B6jNtCKmgM/bj3ygjHzL1z4frKdKH4mikWsC3XBMg3QOwz/wjg/kCGxIFxNvQGN1v9A3OFIWLajM7GXDtY8iTjxdqY71CYgK5o=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=zohomail.com;
	spf=pass  smtp.mailfrom=newwheatzjz@zohomail.com;
	dmarc=pass header.from=<newwheatzjz@zohomail.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1758340812;
	s=zm2022; d=zohomail.com; i=newwheatzjz@zohomail.com;
	h=From:From:To:To:Subject:Subject:Date:Date:Message-ID:Content-Type:Content-Transfer-Encoding:MIME-Version:Feedback-ID:Message-Id:Reply-To:Cc;
	bh=GlFWriZ41w2rQfdX5zu8V6cJmXl7Vux1SM97RqZRIsY=;
	b=Y8VZ/HlLGy8+z/VJCSd5Vr6M+rgc6R8vmFz4UKLwM+lWSik1wJilLeamql3+N11H
	MMYAEtGeCNEdjxZGkWEL7AyzG0FZz0GTBT6YQAEf2FpF/MNx+AFilMuqZbuSdrbHZle
	C5qiB5H8pNBf+W+5GrBqLpsfWt9y28RbiCyXeW6g=
Received: by mx.zohomail.com with SMTPS id 1758340811441892.259128676084;
	Fri, 19 Sep 2025 21:00:11 -0700 (PDT)
From: "newwheatzjz@zohomail.com" <newwheatzjz@zohomail.com>
To: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>
Subject: ath10k-firmware: WCN3990 hw1.0: Add board file for Huawei MateBook E
 2019
Thread-Topic: ath10k-firmware: WCN3990 hw1.0: Add board file for Huawei
 MateBook E 2019
Thread-Index: AQHcKeLIkzSFbD+9J0+viSYmQ5Ufcw==
X-MS-Exchange-MessageSentRepresentingType: 1
Date: Sat, 20 Sep 2025 04:00:09 +0000
Message-ID: <OS9P286MB68716FABA24785E92D55ECB7A210A@OS9P286MB6871.JPNP286.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-Exchange-Organization-SCL: -1
X-MS-TNEF-Correlator: 
X-MS-Exchange-Organization-RecordReviewCfmType: 0
msip_labels: 
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Feedback-ID: rr0801122736f81751ea936040d90f75750000a0978c3669cac57792b80b42e984209636bfb12d4dd3880481:zu08011227e0c33c8b645cb5f5e4a1894c0000fc9dc8216be2ebd8c292b66799ae4ba244f44a490f34652998:rf0801122e697cc77adaef0c8b7a7857ca0000ab4ab89ef12ea26f7454a3c4e589e8c0b513aa765640a444d6143bc42afc3adb:ZohoMail
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250919_210017_433032_7FBA19E9 
X-CRM114-Status: UNSURE (   6.25  )
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
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

Hi,=0A=
=0A=
Huawei MateBook E 2019 is a sdm850-based tablet using WCN3990 wifi chip.=0A=
Using C630's calibration data causes poor 5GHz wifi signal, so add specific=
=0A=
board file for it for optimal wifi performance.=0A=
=0A=
* description for what hardware this is:=0A=
=0A=
  - it is a sdm850 based board with WCN3990 wifi chip=0A=
=0A=
* origin of the board file (did you create it yourself or where you=0A=
  downloaded)=0A=
=0A=
  - It is obtained from Windows (in the FileRepository\qcwlan folder).=0A=
=0A=
* ids to be used with the board file (ATH10K_BD_IE_BOARD_NAME in ath10k)=0A=
=0A=
  - WCN3990 hw1.0=0A=
=0A=
    + bus=3Dsnoc,qmi-board-id=3Dff,qmi-chip-id=3D30214,variant=3DHuawei_Pla=
nck=0A=
      md5sum:=0A=
      cb84594777339fa8d1460a394f4153f6=0A=
=0A=
* attach the actual board file (board.bin)=0A=
=0A=
  - The name of the files are equal to the id string in the board-2.bin=0A=
    (minus the ".bin")=0A=
=0A=
Kind regards,=0A=
        Jingzhou Zhu=

