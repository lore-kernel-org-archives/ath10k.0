Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1154EE49B0
	for <ath10k@archiver.kernel.org>; Wed, 23 Aug 2023 10:06:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Message-ID:Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Date:From:To:Subject:
	Content-Description:MIME-Version:Cc:Content-ID:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=MVbMA1cs3Ga4AamrVozVLDASwG6Fa+YM3ppOu2++uNk=; b=EK5CVwE0oKL2jr
	jAL9S9WDrlU+6VhNBQUY3bQsUlYFxruCC83bd0POm76QE8gpWjP4frNESWI74vPeMy4PLjpLleZWC
	/WRxPN/XLgQ1TH7q8sosJ0cHw5j+eWI2oebp/xNWBjwMlunxVV4raOeEu3WSss9kMrrk7OLvlSUOC
	CqbF4kZV2ppFlO+PPkyu3ZDhVVYr8KIcOXssh1hrXGFbAdGz7jDl52bp5dCEzB/UwIhbLLMJfQqgP
	a4UKNELGPWU/Tzl/Gj8aKfPeYVSv3NLjI8TJ6djWPgzVu/QM2W/SXDUkM8YyTYxT+d4wOW4lG6pxw
	41OHYRjfScxNSRE92tdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYkkh-0008Do-1O;
	Wed, 23 Aug 2023 10:06:15 +0000
Received: from server.perfectservers4u.com ([162.240.39.32])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYkkd-00088u-2y
	for ath10k@lists.infradead.org;
	Wed, 23 Aug 2023 10:06:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=panoramicegypttours.com; s=default; h=Reply-To:Date:From:To:Subject:
	Content-Description:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Sender:Message-ID:Cc:Content-ID:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=YTxuP/C+h4Yt9JNhuGQl1KKvzVdvwgZMpK7RTIoLC9c=; b=euxbbi3jq46McLWoT+vbnxDco6
	4l3x/IXpU59vdZY3qu162UpvZRWzshI5w41tHBgLFe5LUggpXgIFKxZ6+/6IKkGkjxSWMy/dwghyK
	C+C9W8WKSmg8FyK35/j2o1rVDgY1epFKQVkCkaiKQeC1bXnzmSKXfb9IK7VCizf6wHcKmyT/LW3G4
	MklM4f/HT+ZqZD6WU21kL+dBkf6/ahgZ7df1aBawkWo7plf87c3F/Frfrfl0wgZz99M0ZxEpvDqHV
	QZmvh/9YCggrNk/+IhTszHxD+ZZ2b/f48gxHCA4rb/NvHUaJ2sqSeu9acSAF373Qo1PyxKFGLsweP
	m9QaDOeg==;
Received: from [105.8.5.11] (port=54572 helo=[192.168.0.189])
	by server.perfectservers4u.com with esmtpa (Exim 4.96)
	(envelope-from <executive@panoramicegypttours.com>)
	id 1qYkjw-0008Fk-17
	for ath10k@lists.infradead.org;
	Wed, 23 Aug 2023 04:05:28 -0600
MIME-Version: 1.0
Content-Description: Mail message body
Subject: =?utf-8?b?VmzDoWRvdSBzY2h2w6FsZW7DqSBkYXJvdmFjw60gZm9uZHk7IOKCrCAyLDAw?=
 =?utf-8?q?0=2C000=2700_EUR?=
To: ath10k@lists.infradead.org
From: "Pan Richard Wahl" <executive@panoramicegypttours.com>
Date: Wed, 23 Aug 2023 03:05:04 -0700
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - server.perfectservers4u.com
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - panoramicegypttours.com
X-Get-Message-Sender-Via: server.perfectservers4u.com: authenticated_id: executive@panoramicegypttours.com
X-Authenticated-Sender: server.perfectservers4u.com: executive@panoramicegypttours.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230823_030612_080221_0E9C239D 
X-CRM114-Status: SPAM  (  -5.24  )
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
Message-ID: <E1qYkkh-0008Do-1O@bombadil.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

RHJhaMO9IHByw610ZWxpLAoKSnNlbSBSaWNoYXJkIFdhaGwgeiBWZXJub24gVG93bnNoaXAsIE5l
dyBKZXJzZXksIFVTQS4gSmUgbWkgNTIgbGV0IGEgdnlocsOhbCBqc2VtIGphY2twb3QgNTMzIG1p
bGlvbnUgJCBNZWdhIE1pbGxpb25zLCBjb8W+IGplIGplZGVuIHogbmVqdmV0xaHDrWNoIGphY2tw
b3R1IHYgbG90ZXJpaS4gWmFzw61sw6FtIHbDoW0gdHV0byB6cHLDoXZ1LCBhYnljaCB2w6FzIHBv
xb7DoWRhbCBvIHNvdWhsYXMgcyB1c2t1dGVjbmVuw61tIGZ1bmRyYWlzaW5nb3bDqWhvIHByb2pl
a3R1LCBrdGVyw70ganNlbSBqacW+IGRsb3VobyBjaHRlbCB1c2t1dGVjbml0LgoKU290dmEgdGkg
dG8gcHJpcGFkw6EgcG9kZXpyZWzDqSwgaSBrZHnFviBqZSBwcmF2ZGEsIMW+ZSBtZSBuZXpuw6HF
oSBhIMW+ZSBqw6EgbmV6bsOhbSB0ZWJlLiBNw6FtIHJha292aW51IHYgdGVybWluw6FsbsOtbSBz
dMOhZGl1LiBNdWogb8WhZXRydWrDrWPDrSBsw6lrYXIgbWkgcHLDoXZlIHJla2wsIMW+ZSBtw6kg
ZG55IGpzb3Ugc2VjdGVueSBrdnVsaSBtw6ltdSB6aG9yxaF1asOtY8OtbXUgc2UgemRyYXbDrS4g
UG9kbGUgZG9rdG9yYSBzZSBtaSB2IG1vemtvdsOpIGtsZWNpIGNoeXN0w6EgdXNhZGl0IGt1bGth
LiBUcnDDrW0gdG91dG8gbmVtb2PDrSB2w61jZSBuZcW+IDMgcm9reSBhIHByb8WhZWwganNlbSBz
cG91c3RvdSBsw6ljYnksIGFieWNoIGppIHZ5bMOpY2lsLiBWZXTFoWludSBzdsOpaG8gbWFqZXRr
dSBqc2VtIHJvemRhbCByYWRlIGNoYXJpdGF0aXZuw61jaCBvcmdhbml6YWPDrSBhIG9yZ2FuaXph
Y8OtIGEgZG9icm92b2xuZSBqc2VtIHbDoW0gZGFsICjigqwgMiwwMDAsMDAwJzAwIEVVUikgamFr
byBkw6FyZWsgYSBkb3Vmw6FtLCDFvmUgcyB0w61tIHVkZWzDoXRlIGRvYnLDqSB2ZWNpLgoKTXXF
vmV0ZSBwcm9zw61tIG92ZXJpdCBtw6kgdsO9aHJ5IHByb3N0cmVkbmljdHbDrW0gc3Ryw6Fua3kg
WW91VHViZS4gVklEw41URSBNRSBaREUgaHR0cHM6Ly93d3cueW91dHViZS5jb20vd2F0Y2g/dj10
bmUwMkV4TkRydwoKVE9UTyBKRSBWw4HFoCBEQVJPVkFDw40gS8OTRDogW0RGRFc0MzAzNFJXMjAy
M10KCk9kcG92ZXp0ZSBuYSB0ZW50byBlLW1haWwgYSB1dmVkdGUga8OzZCBkYXJ1OiBpbmZvQHdh
aGxmb3VuZGF0aW9uLm9yZwoKUHJpam1ldGUgcHJvc8OtbSBtdWogZGFyLiBNw6FtIGPDoXN0a3Ug
KOKCrCAyLDAwMCwwMDAnMDAgRVVSKSBqYWtvIGRhci4gUHJpam1ldGUgcHJvc8OtbSB0dXRvIGPD
oXN0a3UsIHByb3Rvxb5lIHBybyB2w6FzIG11xb5lIGLDvXQgdmVsa8O9bSBwcsOtbm9zZW0uIFBv
a3VkIHByaWptZXRlIG1vamkgbmFiw61ka3UsIG11c8OtdGUgbWkgb2Rwb3ZlZGV0IHByw61tbyBw
cm9zdHJlZG5pY3R2w61tIGUtbWFpbHU6IGluZm9Ad2FobGZvdW5kYXRpb24ub3JnCgpDw610w61t
IHNlIHZlbG1pIMWhcGF0bmUgYSBtw6FtIHZlbGvDvSBzdHJhY2gsIHYgbm9jaSBhbmkgdmUgZG5l
IHNrb3JvIG5lc3DDrW0uIE5lbW9odSB6ZW1yw610IGJleiBkYXJvdsOhbsOtIHbFoWVjaCB0ZWNo
dG8gcGVuZXosIGppbmFrIHNpIG15c2zDrW0sIMW+ZSBieSB0byBieWxvIHBsw710dsOhbsOtLiBU
b3RvIGplIG3DqSBuZWp6YXrFocOtIHByw6Fuw60gYSBwcm9zw61tLCBwcmFjdWp0ZSBzZSBtbm91
IGEgcHJvdmVkdGUgdG8uIE1vxb5uw6EgYnVkdSBtw610IHDDoXIgbWVzw61jdSDFvml2b3RhIG5h
IHTDqXRvIG7DoWRoZXJuw6kgemVtaSwgYWxlIGNoY2kgY2luaXQgZG9icm8gdsOhbWkgYSBvc3Rh
dG7DrW1pLiBDaGNpLCBhYnkgc2kgbcOpIGptw6lubyBwYW1hdG92YWxpIG5hIHplbWkgaSB2IG5l
YmkuCgpTbmHFvsOtbSBzZSBvc2xvdml0IG5lemlza292w6kgc2lyb3RjaW5jZSBhIHByaXNwZXQg
a2Ugem3DrXJuZW7DrSBjaHVkb2J5IGEgcG9za3l0bm91dCBuw6FsZcW+aXRvdSB6ZHJhdm90bsOt
IHDDqWNpIGplZG5vdGxpdmN1bSwgemVqbcOpbmEgYmVoZW0gdMOpdG8gc3ZldG92w6kgcGFuZGVt
aWUgYSBpbmZsYWNlLiBCeWwgYnljaCB0YWvDqSByw6FkLCBrZHlieXN0ZSBjw6FzdCB0b2hvdG8g
ZGFydSBpbnZlc3RvdmFsaSBkbyB2ZXJlam7DqSBpbmZyYXN0cnVrdHVyeSwgYWJ5c3RlIHBvbW9o
bGkgbmV6YW1lc3RuYW7DvW0gbGlkZW0gdmUgdmHFocOtIHplbWkgbmFiw616ZXQgcHLDoWNpLiBW
eWJyYWwganNlbSBzaSB0ZSwgcHJvdG/FvmUgdGkgdmVyw61tLiBQb3RyZWJ1amkgdmHFoWkgcGxu
b3Ugc3BvbHVwcsOhY2kgb2hsZWRuZSB0b2hvdG8gZGFydS4gWmRlIGplIHbDoW1pIHp2b2xlbsO9
IHRham7DvSBrw7NkOiBbREZEVzQzMDM0UlcyMDIzXSBhIHByb3PDrW0sIG5lc2RlbHVqdGUga8Oz
ZCBuaWtvbXUsIHBva3VkIG3DoXRlIHrDoWplbSBhIGpzdGUgb2Nob3RuaSBzZSBtbm91IHNwb2x1
cHJhY292YXQuIEtvbnRha3R1anRlIG1lIHByb3PDrW0gcyB2YcWhw61tIGRhcm92YWPDrW0vdGFq
bsO9bSBrw7NkZW0gW0RGRFc0MzAzNFJXMjAyM10gYSBjZWzDvW0gam3DqW5lbSB6ZGUgbmEgbXVq
IHNvdWtyb23DvSBlLW1haWw6IGluZm9Ad2FobGZvdW5kYXRpb24ub3JnCgpQYW4gUmljaGFyZCBX
YWhsCkVtYWlsOiBpbmZvQHdhaGxmb3VuZGF0aW9uLm9yZwpBZGRyZXNzOiBWZXJub24gVG93bnNo
aXAsIE5ldyBKZXJzZXksIFVTQQpSaWNoYXJkIFdhaGwgRm91bmRhdGlvbgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYXRoMTBrIG1haWxpbmcgbGlzdAph
dGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2F0aDEwawo=
