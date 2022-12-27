Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B731AC4167B
	for <ath10k@archiver.kernel.org>; Tue, 27 Dec 2022 22:03:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:
	Subject:To:From:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=OQA6CRn4dcWffZKqJ/oCpuMUJNQeV97uDDhgM9bqa3c=; b=m1jQY2lCIuAbmG
	81cY8sJJBhDBQnSR9BnTXC01NaUN+wGAmto1WkNjmt5EHfjPVPU2ybB0JozjJn0h81LYiqNSHZZuI
	oCvkuJIhdR40nc6vlp0ljxuKYF49OFhjIJCex74GdDYmP87inTKngRsf5qb5q1oyCL46MTI3l7ST5
	ctzNmrB3S7W48k1biDOxsicmtGZbRZLmoN4dzZSXtEP6QWrV2XxYYjp3so2yAM1N3u91arxn59rcL
	zOqSqObj1a9IrKmeIf67ux3sZ58MYPzblD4fDzZ2pSA+IrDrjbFrYJlBBLwwQCRrTwUFzY/oiozBt
	Ju8BF6OnZMC32ASpJxuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pAI2V-00GhsV-Q3; Tue, 27 Dec 2022 22:03:15 +0000
Received: from [59.16.217.6] (helo=savemail.savezone.co.kr)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pAI2T-00Ghpz-Ix
	for ath10k@lists.infradead.org; Tue, 27 Dec 2022 22:03:14 +0000
Received: from savezone.co.kr (156.0.212.38) by savemail.savezone.co.kr
 (2002:3b10:d906::3b10:d906) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 28 Dec 2022 07:03:01 +0900
From: Jacques BOUCHEX <sqladmin@savezone.co.kr>
To: <ath10k@lists.infradead.org>
Subject: Re : Bonjour,
Date: Tue, 27 Dec 2022 23:01:46 +0100
Message-ID: <20221227230146.5AF8BC601DF26407@savezone.co.kr>
MIME-Version: 1.0
X-ClientProxiedBy: savemail.savezone.co.kr (2002:3b10:d906::3b10:d906) To
 savemail.savezone.co.kr (2002:3b10:d906::3b10:d906)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221227_140313_643418_4BAD469F 
X-CRM114-Status: UNSURE (  -2.16  )
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
Reply-To: jacques_bouchex@yahoo.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

Qm9uam91ciwKRMOpc29sw6kgcG91ciBjZXR0ZSBmYcOnb24gZGUgdm91cyBjb250YWN0ZXIsIGpl
IHZpZW5zIGRlIHZvaXIgdm90cmUgCnByb2ZpbCBldCBqJ2FpIHBlbnPDqSBxdWUgdm91cyDDqXRp
ZXogbGEgcGVyc29ubmUgZG9udCBqJ2F2YWlzIApiZXNvaW4uIEVuIGJyZWYsIGplIG0nYXBwZWxs
ZSBKYWNxdWVzIEJPVUNIRVgsIGQnb3JpZ2luZSAKZnJhbsOnYWlzZS4gSmUgc3VpcyBhdHRlaW50
IGQndW5lIG1hbGFkaWUgZ3JhdmUgcXVpIG1lIGNvbmRhbW5lIMOgIAp1bmUgbW9ydCBjZXJ0YWlu
ZSwgdW4gY2FuY2VyIGR1IGNlcnZlYXUsIGV0IGplIGRpc3Bvc2UgZCd1bmUgCnNvbW1lIGRlIHZp
bmd0LWNpbnEgbWlsbGlvbnMgY2lucSBjZW50IG1pbGxlIGV1cm9zICgyNS41MDAuMDAwIApldXJv
cykgcXVlIGplIHNvdWhhaXRlIHJlbWV0dHJlIMOgIHVuIHRpZXJzIGZpYWJsZSBldCBob25uw6p0
ZSBwb3VyIApzb24gYm9uIHVzYWdlLiBKJ2FpIHVuZSBlbnRyZXByaXNlIHF1aSBpbXBvcnRlIGRl
IGwnaHVpbGUgcm91Z2UgCmVuIEZyYW5jZSBldCBkYW5zIGQnYXV0cmVzIHBheXMuIEonYWkgcGVy
ZHUgbWEgZmVtbWUgZXQgZGV1eCAKYWRvcmFibGVzIGVuZmFudHMgaWwgeSBhIDEwIGFucyBkYW5z
IHVuIG1hbGhldXJldXggYWNjaWRlbnQgZGUgbGEgCnJvdXRlLiBKJ2FpbWVyYWlzIGZhaXJlIGRv
biBkZSBjZXR0ZSBzb21tZSBhdmFudCBkZSBtb3VyaXIgY2FyIAptZXMgam91cnMgc29udCBjb21w
dMOpcy4gVmV1aWxsZXogbSdlbnZveWVyIHVuIGNvdXJyaWVsIMOgIApsJ2FkcmVzc2Ugc3VpdmFu
dGUgOiBqYWNxdWVzX2JvdWNoZXhAeWFob28uY29tIFF1ZSBsZSBTZWlnbmV1ciAKdm91cyBiw6lu
aXNzZS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmF0
aDEwayBtYWlsaW5nIGxpc3QKYXRoMTBrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMGsK
