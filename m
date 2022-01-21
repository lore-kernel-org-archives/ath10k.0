Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12A5AC433F5
	for <ath10k@archiver.kernel.org>; Fri, 21 Jan 2022 15:05:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zjY2uY5aBPVGwocaW9+ARmMpDSP99NgUE3TYxMU4OXU=; b=z16LS6i2EVbc1f
	ddoX4E/MlIhOjhtYxn9dYPcDMVloMv0zzODQ7JaWEQ80WzEWqezRXHYG2vrWbL0g2eMlS3Kv5vkkO
	e/sGNR4E5PIf4IgeVoOzWaFLwCDDK1E0STub5V6eVR+7EWhu+BDOpwH8YdCFWzFv4lM+BM9VMseyS
	RSQeYxOuv6/a7wZjgdGGtjZxIb3kwbjbSN0YbCvhWBOFvSsnDV3UO/EhOflWlywbIUpiFXQ1Wj9gH
	q+R5dqOgwetBUSTpTwYd0SKDpQ0VskTuEJMBBRZ0j/DBWKXgheeFnhHSwFygPL/7jq/238S6lGDLr
	DKmnreeF+rU5Y7uZYDkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nAvTV-00FSG4-Ht; Fri, 21 Jan 2022 15:05:13 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nAvTS-00FSFB-Sy
 for ath10k@lists.infradead.org; Fri, 21 Jan 2022 15:05:12 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 78FE06190D;
 Fri, 21 Jan 2022 15:05:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C7EEC340E1;
 Fri, 21 Jan 2022 15:05:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642777509;
 bh=gQk54ft8U+6QIt6NNGvIGIO1H5Bcdm9rIl9c9/0339Y=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=l57X8lMQ2BRF+tEoAsTlzTzf46Z2CoIfFoTk0kdErmY2U3+LI2Ep5c0hiaITY2iwy
 wQK8Xbiy1+4U57kWKeDM+2lYq4uZAr+P/00pfTLxxQG03MFTzpTnX6w1imeSU10Me1
 9q5IYtkOdMQE7Gr+5Ma+kU/ZjGDLgHkZUSgxSooSXh7H5NiRp4ESv8+9bULcEVSAYU
 qUE9H4LbgjbDmR7oQMUW02q4p92YP24pDmRsSiuEMb7nlmPUlbEtqSTLJ4l4sEAvch
 o/TeaQxsb9vx+dlbg9ELIyjJRk2pioaRcOTl1tAPc8eBodgIm7e8FjqU6G6ceOyPzo
 iW7/CoPBb5dJQ==
From: Kalle Valo <kvalo@kernel.org>
To: Tim Klicks <tim.klicks@gmail.com>
Cc: ath10k@lists.infradead.org
Subject: Re: ath10k-firmware: QCA6174 hw3.0: Add additional board-bin file
References: <9d7a403d-61be-d8ca-57e5-7d5a1c412fb4@gmail.com>
Date: Fri, 21 Jan 2022 17:05:06 +0200
In-Reply-To: <9d7a403d-61be-d8ca-57e5-7d5a1c412fb4@gmail.com> (Tim Klicks's
 message of "Sun, 25 Oct 2020 12:35:50 +0100")
Message-ID: <87y23986zh.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220121_070511_013638_1128C047 
X-CRM114-Status: GOOD (  19.26  )
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

VGltIEtsaWNrcyA8dGltLmtsaWNrc0BnbWFpbC5jb20+IHdyaXRlczoKCj4gVW5mb3J0dW5hdGVs
eSBJIGFtIG5ldyB0byBzdWJtaXR0aW5nIGJpbiBmaWxlcyAtIHBsZWFzZSBleGN1c2UgaWYKPiBh
bnl0aGluZyBpcyBub3QgbWF0Y2hpbmcgb3IgbWlzc2luZyBhbmQgY29ycmVjdCBtZSBpZiBhbnl0
aGluZyBpcwo+IG1pc3NpbmcuCj4KPiBGb2xsb3dpbmcKPiBodHRwczovL3dpcmVsZXNzLndpa2ku
a2VybmVsLm9yZy9lbi91c2Vycy9kcml2ZXJzL2F0aDEway9ib2FyZGZpbGVzCj4gaGVyZSBpcyB3
aGF0IEkgdGhpbmsgaXMgbmVlZGVkLgo+Cj4gKiBkZXNjcmlwdGlvbiBmb3Igd2hhdCBoYXJkd2Fy
ZSB0aGlzIGlzOgo+IEFjY29yZGluZyB0byAnbHNwY2kgLXZ2dicKPiAtIFF1YWxjb21tIEF0aGVy
b3MgUUNBNjE3NCA4MDIuMTFhYyBXaXJlbGVzcyBOZXR3b3JrIEFkYXB0ZXIgKHJldiAzMikKPiDC
oCAtIFN1YnN5c3RlbTogTGl0ZS1PbiBDb21tdW5pY2F0aW9ucyBJbmMgRGV2aWNlIDA4NDcKPgo+
ICogb3JpZ2luIG9mIHRoZSBib2FyZCBmaWxlIChkaWQgeW91IGNyZWF0ZSBpdCB5b3Vyc2VsZiBv
ciB3aGVyZSB5b3UKPiBkb3dubG9hZGVkKQo+IFRoZSBib2FyZC5iaW4gZmlsZSB3aGljaCBpcyBu
ZWVkZWQgdG8gbWFrZSBteSBXaUZpIGFkYXB0ZXIgd29yayBjYW4gYmUKPiBmb3VuZCBoZXJlOgo+
IC0gaHR0cHM6Ly9naXRodWIuY29tL2t2YWxvL2F0aDEway1maXJtd2FyZS9wdWxsLzMKPiBRdW90
ZToKPiDCoCAidGhpcyBpcyB0aGUgcmVuYW1lZCBlZXByb21fYXI2MzIwXzNwMF9ORkEzNjR4cC5i
aW4gd2hpY2ggd2FzIHdhcwo+IG5lZWRlZCB0byBnZXQgbXkga2lsbGVyIDE1MzUgd29ya2luZy4i
Cj4gLS0+IAo+IGh0dHBzOi8vZ2l0aHViLmNvbS9rdmFsby9hdGgxMGstZmlybXdhcmUvcmF3Lzdl
NTZjYmI5NDE4MmEyZmRhYjExMGNmNWJmZWRlZDhmZDFkNDRkMzAvUUNBNjE3NC9odzMuMC9ib2Fy
ZC0yLmJpbgo+Cj4gLSBSZWFkaW5nIHRoZSBwdWxsIHJlcXVlc3QsIGl0IHdhcyBtb3N0IGxpa2Vs
eSB0YWtlbiBmcm9tIHN0b2NrCj4gZmlybXdhcmUgaW1hZ2UKPgo+ICogaWRzIHRvIGJlIHVzZWQg
d2l0aCB0aGUgYm9hcmQgZmlsZSAoQVRIMTBLX0JEX0lFX0JPQVJEX05BTUUgaW4gYXRoMTBrKQo+
IEkgcGVyc29uYWxseSBkbyBub3Qga25vdyB3aGF0IGlzIG1lYW50L25lZWRlZCBoZXJlLCBidXQg
SSBzdXNwZWN0IHRoYXQKPiB0aGlzIGlzIG1lYW50Ogo+IC0gUUNBNjE3NCBodzMuMAo+IMKgICsK
PiBidXM9cGNpLHZlbmRvcj0xNjhjLGRldmljZT0wMDNlLHN1YnN5c3RlbS12ZW5kb3I9MTFhZCxz
dWJzeXN0ZW0tZGV2aWNlPTA4NDcKPiDCoCBDb21pbmcgZnJvbSB0aGlzIGpvdXJuYWxjdGwgbWVz
c2FnZToKPiDCoMKgwqAgLSBhdGgxMGtfcGNpIDAwMDA6MDE6MDAuMDogZmFpbGVkIHRvIGZldGNo
IGJvYXJkIGRhdGEgZm9yCj4gYnVzPXBjaSx2ZW5kb3I9MTY4YyxkZXZpY2U9MDAzZSxzdWJzeXN0
ZW0tdmVuZG9yPTExYWQsc3Vic3lzdGVtLWRldmljZT0wODQ3Cj4gZnJvbSBhdGgxMGsvUUNBNjE3
NC9odzMuMC9ib2FyZC0yLmJpbikKPgo+ICogYXR0YWNoIHRoZSBhY3R1YWwgYm9hcmQgZmlsZSAo
Ym9hcmQuYmluKQo+IC0gcWNhNjE3NC0xNjhjLTAwM2UuYmluCj4gLSBtZDVzdW06IGRmNWJhMWNh
OTJmOThiYmQ5Y2I1MzdkZGM1NzQ3MDExwqAgcWNhNjE3NC0xNjhjLTAwM2UuYmluCj4KPiBIb3Bl
IGV2ZXJ5dGhpbmcgaXMgY29ycmVjdC4gSWYgbm90LCBwbGVhc2UgY29udGFjdCBtZS4KClRoYW5r
cywgSSBtYW51YWxseSBhZGRlZCBpdCBub3cgYnV0IHBsZWFzZSBkbyBkb3VibGUgY2hlY2sgdGhh
dCBJIGRpZG4ndAptYWtlIGFueSBlcnJvcnM6CgpOZXc6CmJ1cz1wY2ksdmVuZG9yPTE2OGMsZGV2
aWNlPTAwM2Usc3Vic3lzdGVtLXZlbmRvcj0xMWFkLHN1YnN5c3RlbS1kZXZpY2U9MDg0NwoKQ2hh
bmdlZDoKCgpEZWxldGVkOgoKMSBib2FyZCBpbWFnZShzKSBhZGRlZCwgMCBjaGFuZ2VkLCAwIGRl
bGV0ZWQsIDg4IGluIHRvdGFsCgpodHRwczovL2dpdGh1Yi5jb20va3ZhbG8vYXRoMTBrLWZpcm13
YXJlL2NvbW1pdC81NTYzMjFhOWM5YzU0YzFlMTE2ZGMyNGM3NTVmNmUxYTVkYzE2ZTJjCgotLSAK
aHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wcm9qZWN0L2xpbnV4LXdpcmVsZXNzL2xpc3Qv
CgpodHRwczovL3dpcmVsZXNzLndpa2kua2VybmVsLm9yZy9lbi9kZXZlbG9wZXJzL2RvY3VtZW50
YXRpb24vc3VibWl0dGluZ3BhdGNoZXMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmF0aDEwayBtYWlsaW5nIGxpc3QKYXRoMTBrQGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMGsK
