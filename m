Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D850BC433F5
	for <ath10k@archiver.kernel.org>; Wed,  1 Dec 2021 09:06:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=t+2V2TOmphiyBO75nO0fS3W44EqGS2aZK9kIRv+TD78=; b=why7tz2SFmTUrZ
	4oBJMgptWLchEncSuxLwQhQnNlrLYalg2Ekbub3YporIrFSu6LKigBhHo+cTMGSceA5olAJDfQIXN
	XO68w77KxfZqPAPM1gnA8v1SQRt3eiHct4+Ri0O14WrMVN2J42EkF3/LL+jr7NXzAy+7sMlGCiwg8
	GF2iH+zXK28ibb8mA4MNTdmzBWgU5zi4LqICnH/hVvr7OUBoy58Pd604iU0h5xBk4uJGFWhVLfFPE
	FPy4Oej1SwOFgCdftjxKQ/FCvbBoHVJDQeO3qIvADWAPEe4PcCjVjii37mUBw96brGyFtLTrYKU+X
	AIrvTMCeuxz/S/IAuz5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1msLZ7-007tnW-R4; Wed, 01 Dec 2021 09:06:13 +0000
Received: from mail.webdeluxgroup.com ([51.195.117.175])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1msLZ0-007tlX-43
 for ath10k@lists.infradead.org; Wed, 01 Dec 2021 09:06:11 +0000
Received: by mail.webdeluxgroup.com (Postfix, from userid 1002)
 id 7C7A5A2171; Wed,  1 Dec 2021 09:05:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=webdeluxgroup.com;
 s=mail; t=1638349561;
 bh=Ikssx+VmDQhoHuLzKgesrzZ3VGIyKr0VUFS/Kpp5X4A=;
 h=Date:From:To:Subject:From;
 b=ZcGMwuQR0Lg01Sdau6hNm/Lgbx3qGcgb6U1vCuEZl2pHF3Cq20ZboFr/UeP2v+P53
 gBHs4vxZ4GAdFnDb8r/RmLN37s2ueJRoRZtOpwmHSacjOGjC9ouyxApFyyvDCz+QVN
 h4rtSfTrrP+CvniHeJNbw7Bb1szMvvdi1nY6HUI5ieb9zhwO9TVQZjq7NwLn+5QBSf
 Fzc3IrmDqUHfgEEWtByD9e+C6Ol02j8Qjcf71/T/LqkW6gUoQ6ZTVhhKg4c89kJPpW
 2Pkcq7bWcRBFg51qEiMXZxTQ08TN5Mem3VAKZlYTVgba0s4rfa1JwG2/idJfSB0Mf0
 aZ8S5hJFQae8Q==
Received: by mail.webdeluxgroup.com for <ath10k@lists.infradead.org>;
 Wed,  1 Dec 2021 09:05:54 GMT
Message-ID: <20211201074500-0.1.3i.a143.0.sj7cp5mifl@webdeluxgroup.com>
Date: Wed,  1 Dec 2021 09:05:54 GMT
From: =?UTF-8?Q?"Ji=C5=99=C3=AD_Novotn=C3=BD"?=
 <jiri.novotny@webdeluxgroup.com>
To: <ath10k@lists.infradead.org>
Subject: =?UTF-8?Q?=C3=9Asp=C4=9Bch_kampan=C4=9B?=
X-Mailer: mail.webdeluxgroup.com
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211201_010606_396624_B03CBB8A 
X-CRM114-Status: UNSURE (   1.21  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

RG9icsO9IGRlbiwKClByb2TDoXbDoXRlIHN2w6kgdsO9cm9ia3kgcMWZw61tbyBzcG90xZllYml0
ZWzFr20gcHJvc3TFmWVkbmljdHbDrW0ga2Fuw6FsdSBFLUNvbW1lcmNlPyAKClBva3VkIGFubywg
csOhZCBieWNoIHbDoW0gcMWZZWRzdGF2aWwgbW/Fvm5vc3RpIGEgcMWZw61rbGFkeSwgamFrIHp2
w73FoWl0IHbDvW5vc3kgeiB0b2hvdG8ga2Fuw6FsdS4gCgpQxZllZCDEjWFzZW0gc2UgbsOhbSBv
enZhbGEgc3BvbGXEjW5vc3QsIGt0ZXLDoSBjaHTEm2xhIHbDvXJhem7EmyB6bGVwxaFpdCB2w71z
bGVka3kgdmUgdsWhZWNoIGthbsOhbGVjaCwgamVqaWNoxb4gcHJvc3TFmWVkbmljdHbDrW0gb3Ns
b3Z1amUgesOha2F6bsOta3kuCgpDw61sZW0gYnlsbyBkb3PDoWhub3V0IHN0YWJpbG7DrWNoLCBt
xJvFmWl0ZWxuw71jaCB2w71ub3PFryBhIHRha8OpIHJvesWhw63FmWl0IHDFr3NvYm5vc3QgbmEg
bWV6aW7DoXJvZG7DrSB0cmh5LiAKClpqZWRub2R1xaFpbGkganNtZSBzdHJ1a3R1cnUga2FtcGFu
w60sIHpsZXDFoWlsaSByb3ptYW5pdG9zdCByZWtsYW0gYSBrb211bmlrYWNlIGEgdGFrw6kganNt
ZSB2eXR2b8WZaWxpIG5lc3RhbmRhcmRuw60ga2F0YWxvZyB2w71yb2Jrxa8uIEltcGxlbWVudG92
YWxpIGpzbWUgxZllxaFlbsOtLCBrdGVyw6EgdmVkbGEgayBsZXDFocOtbXUgdsO9c2xlZGt1IENQ
QywgenbDvcWhZW7DrSBDVFIgYSB6bGVwxaFlbsOtIGtvbnZlcnplIHBvdGVuY2nDoWxuw61jaCB6
w6FrYXpuw61rxa8gbmEgbmFrdXB1asOtY8OtIHrDoWthem7DrWt5LiAKCkTDrWt5IG5hxaFpbSBr
b21wbGV4bsOtbSBha3Rpdml0w6FtIHNlIHbDvXJhem7EmyB6dsO9xaFpbCBST0kgaW5kZXggYSB2
w71ub3N5IGHFviBvIDk1ICUuIFN0b2rDrSB6YSB0byBwcm9icmF0LCBqYWsgdG8gdmUgVmHFocOt
IHNwb2xlxI1ub3N0aSB2eXBhZMOhIGEgY28gdsOhbSBtxa/FvmVtZSBuYWLDrWRub3V0LiBQb2t1
ZCBtw6F0ZSB6w6FqZW0gbyBrcsOhdGvDvSByb3pob3ZvciwgZGVqdGUgbWkgdsSbZMSbdC4gTsOh
xaEgYW5nbGlja3kgbWx1dsOtY8OtIHrDoXN0dXBjZSBWw6FzIGJ1ZGUgb2thbcW+aXTEmyBrb250
YWt0b3ZhdC4KCgpTIHDFmcOhdGVsc2vDvW0gcG96ZHJhdmVtCkppxZnDrSBOb3ZvdG7DvQoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYXRoMTBrIG1haWxp
bmcgbGlzdAphdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0aDEwawo=
