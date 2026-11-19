Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9090606A333
	for <ath10k@archiver.kernel.org>; Thu, 19 Nov 2026 12:12:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=EiYAowf7;
	dkim=pass (1024-bit key) header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=M4jgnbgy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:From:MIME-Version:
	Subject:Cc:To:Message-ID:Content-Transfer-Encoding:Content-Type:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=yynbW/DlMBNzkWW4z9UkacyU4uLoNJIDEFOjK4ES0J4=; b=EiYAowf7o2C/Xf15Dqs4HcLCCI
	DtlFlr0peD3ewFbRvT5MsPXYWLY7/9MiHYX9boGLNTcGH/nanTmscp/ZNp9K+UieMh3Sml/EestOi
	xV0i8fkW+0D6kK5dPbkeui/x82y4cojKHxdL9Q5hrH34CJ3JgIpXKp8yF4fq9fxsYlpESrzTMTIZn
	J6Dd3afl7bd94PEcQvxUmVGvL8vhO3NiWKR6z4u0XXvZL8aakYB+GWHZjrYrMDG/z4FzLMVxQEvwI
	SYnxKqQLtPFYKvQrRwnLLaQDQtUJGFoI9BgGQJxs4za3AYQIHH5IT7kjVKOBDEIftuVOPbxBziISt
	R80fnATA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU105-0000000BoXw-3FpP;
	Thu, 19 Nov 2026 12:12:25 +0000
Received: from mail-m158180.netease.com ([47.251.158.180])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU0zx-0000000BoUM-06dz
	for ath10k@lists.infradead.org;
	Thu, 19 Nov 2026 12:12:21 +0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Message-ID: <AKkArwCmLES49KBl-vFi9qpQ.1.1795090322414.Hmail.202321181@mail.sdu.edu.cn>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Jeff Johnson <jjohnson@kernel.org>, linux-wireless@vger.kernel.org, 
	ath10k@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: =?UTF-8?B?UmU6UmU6IFtQQVRDSF0gd2lmaTogYXRoMTBrOiBGaXggcG90ZW50aWFsIENFIGNvbmZpZ3VyYXRpb24gbGVha3Mgb24gUENJIHByb2JlIGZhaWx1cmU=?=
X-Priority: 3
X-Mailer: HMail Webmail Server V2.0 Copyright (c) 2016-163.com web
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Received: from 202321181@mail.sdu.edu.cn( [101.76.249.61] ) by ajax-webmail ( [127.0.0.1] ) ; Thu, 19 Nov 2026 20:12:02 +0800 (GMT+08:00)
From: =?UTF-8?B?5p2O5bm/56GV?= <liguangshuo@mail.sdu.edu.cn>
Date: Thu, 19 Nov 2026 20:12:02 +0800 (GMT+08:00)
X-HM-Tid: 0aa1f3b826e5d0cdkusy47eba70515f57
X-HM-MType: 1
X-HM-NTES-SC: AL0_4z5B86Wr4Tz9jdMF+bhXMVHpP02bZAKsMEiErRSAekjx+ys+KNZNl0PLwl
	f2MeqR5lbiqKsoq8sm3hZVy9q3VVBNOjIUwfWq1GfV2NBR9WJV5pp9Gwt04oeFjraKOA9zaWoBi2
	nAAG80yDIj2vqDR+BK0Ob1gW1HTqO8T3q701Y=
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZTkNPVktMGUJLS08fHR5DTFYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlKS0pVTE1VSU9CVU1KWVdZFhoPEhUdFFlBWU9LSFVKS0
	lCTUhKVUpLS1VLWQY+
DKIM-Signature: a=rsa-sha256;
	b=M4jgnbgyBbT/zCtM99LG5ruJDn0UOgjetmjDPjJ9KVHCuAyHswRqsXSMZgLhvmbAJ1lSMuUeQyD2rX1X+HauARg7DpfI1TJ8NDC2S0Jc1rOFgZU05K+KYOa3noM+RWj/BDPcHYY8xR6gEn72AOcQ18Gb7Oc9I6+2UyhqwVQ5GqU=; c=relaxed/relaxed; s=default; d=mail.sdu.edu.cn; v=1;
	bh=yynbW/DlMBNzkWW4z9UkacyU4uLoNJIDEFOjK4ES0J4=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_041219_334185_CF8AC0BE 
X-CRM114-Status: GOOD (  14.94  )
X-Spam-Score: -2.1 (--)
X-BeenThere: ath10k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath10k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

CgoKSGkgTG9pYywKCgpUaGFua3MgZm9yIHRoZSByZXZpZXcuCgrlj5Hku7bkurrvvJpMb2ljIFBv
dWxhaW4gPGxvaWMucG91bGFpbkBvc3MucXVhbGNvbW0uY29tPgrlj5HpgIHml6XmnJ/vvJoyMDI2
LTExLTA0IDIwOjIyOjQwCuaUtuS7tuS6uu+8mkd1YW5nc2h1byBMaSA8bGlndWFuZ3NodW9AbWFp
bC5zZHUuZWR1LmNuPgrmioTpgIHkurrvvJpKZWZmIEpvaG5zb24gPGpqb2huc29uQGtlcm5lbC5v
cmc+LGxpbnV4LXdpcmVsZXNzQHZnZXIua2VybmVsLm9yZyxhdGgxMGtAbGlzdHMuaW5mcmFkZWFk
Lm9yZyxsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnCuS4u+mimO+8mlJlOiBbUEFUQ0hdIHdp
Zmk6IGF0aDEwazogRml4IHBvdGVudGlhbCBDRSBjb25maWd1cmF0aW9uIGxlYWtzIG9uIFBDSSBw
cm9iZSBmYWlsdXJlPkhpIEd1YW5nc2h1bywKPgo+T24gV2VkLCBOb3YgNCwgMjAyNiBhdCAzOjM0
4oCvQU0gR3VhbmdzaHVvIExpIDxsaWd1YW5nc2h1b0BtYWlsLnNkdS5lZHUuY24+IHdyb3RlOgo+
Pgo+PiBQQ0kgY2xhaW0sIHdha2V1cCBvciBJUlEgaW5pdGlhbGl6YXRpb24gZmFpbHVyZXMgYnlw
YXNzCj4+IGF0aDEwa19wY2lfcmVsZWFzZV9yZXNvdXJjZSgpLCBsZWFraW5nIHRoZSB0aHJlZSBj
b25maWd1cmF0aW9uIGFycmF5cwo+PiBhbGxvY2F0ZWQgYnkgYXRoMTBrX3BjaV9zZXR1cF9yZXNv
dXJjZSgpLgo+Pgo+PiBGcmVlIHRoZSBhcnJheXMgd2l0aCB0aGUgQ0UgcGlwZXMgb24gdGhlIGNv
bW1vbiB1bndpbmQgcGF0aC4gS2VlcAo+PiB0aGUgbGF0ZXIgaGFyZHdhcmUgY2xlYW51cCBzZXBh
cmF0ZSBzbyB0aGUgYXJyYXlzIGFyZSBmcmVlZCBvbmNlLgo+Pgo+PiBUaGlzIGlzc3VlIHdhcyBm
b3VuZCBieSBvdXIgc3RhdGljIGFuYWx5c2lzIHRvb2wgdW5kZXIgZGV2ZWxvcG1lbnQuCj4+Cj4+
IEZpeGVzOiAxY2ZkMzQyNmVmOTggKCJhdGgxMGs6IEZpeCBOVUxMIHBvaW50ZXIgZGVyZWZlcmVu
Y2UgaW4gQUhCIGRldmljZSBwcm9iZSIpCj4+IFNpZ25lZC1vZmYtYnk6IEd1YW5nc2h1byBMaSA8
bGlndWFuZ3NodW9AbWFpbC5zZHUuZWR1LmNuPgo+PiAtLS0KPj4gVmFsaWRhdGlvbjogeDg2LTY0
IENsYW5nIFc9MSBjaGFuZ2VkLW9iamVjdCBidWlsZHMgcGFzc2VkIHdpdGgKPj4gYWxsbW9kY29u
ZmlnIGFuZCBhbGx5ZXNjb25maWcuIE5vIGhhcmR3YXJlL2tlcm5lbCBydW50aW1lIHRlc3Qgb3Ig
ZnVsbAo+PiBsaW5rZWQta2VybmVsIGJ1aWxkLgo+PiBPcGVuQUkgQ29kZXggYXNzaXN0ZWQgd2l0
aCBzb3VyY2UgcmV2aWV3LCBwYXRjaCBpbXBsZW1lbnRhdGlvbiBhbmQKPj4gY29tbWl0LW1lc3Nh
Z2UgZHJhZnRpbmcuIFRoZSBzdWJtaXR0ZXIgaGFzIHJldmlld2VkIHRoZSBjaGFuZ2VzLgo+Pgo+
PiAgZHJpdmVycy9uZXQvd2lyZWxlc3MvYXRoL2F0aDEway9wY2kuYyB8IDcgKysrKysrLQo+PiAg
MSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+Pgo+PiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9uZXQvd2lyZWxlc3MvYXRoL2F0aDEway9wY2kuYyBiL2RyaXZlcnMv
bmV0L3dpcmVsZXNzL2F0aC9hdGgxMGsvcGNpLmMKPj4gaW5kZXggMzM1YmM3YzQ4OGU0Li5mM2M0
ZmUxM2Y3NmIgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvbmV0L3dpcmVsZXNzL2F0aC9hdGgxMGsv
cGNpLmMKPj4gKysrIGIvZHJpdmVycy9uZXQvd2lyZWxlc3MvYXRoL2F0aDEway9wY2kuYwo+PiBA
QCAtMzcxNiw3ICszNzE2LDkgQEAgc3RhdGljIGludCBhdGgxMGtfcGNpX3Byb2JlKHN0cnVjdCBw
Y2lfZGV2ICpwZGV2LAo+PiAgICAgICAgIGF0aDEwa19wY2lfZnJlZV9pcnEoYXIpOwo+Pgo+PiAg
ZXJyX2RlaW5pdF9pcnE6Cj4+IC0gICAgICAgYXRoMTBrX3BjaV9yZWxlYXNlX3Jlc291cmNlKGFy
KTsKPj4gKyAgICAgICBhdGgxMGtfcGNpX3J4X3JldHJ5X3N5bmMoYXIpOwo+PiArICAgICAgIG5l
dGlmX25hcGlfZGVsKCZhci0+bmFwaSk7Cj4+ICsgICAgICAgYXRoMTBrX3BjaV9jZV9kZWluaXQo
YXIpOwo+Pgo+PiAgZXJyX3NsZWVwOgo+PiAgICAgICAgIGF0aDEwa19wY2lfc2xlZXBfc3luYyhh
cik7Cj4+IEBAIC0zNzI0LDYgKzM3MjYsOSBAQCBzdGF0aWMgaW50IGF0aDEwa19wY2lfcHJvYmUo
c3RydWN0IHBjaV9kZXYgKnBkZXYsCj4+Cj4+ICBlcnJfZnJlZV9waXBlczoKPj4gICAgICAgICBh
dGgxMGtfcGNpX2ZyZWVfcGlwZXMoYXIpOwo+PiArICAgICAgIGtmcmVlKGFyX3BjaS0+YXR0cik7
Cj4+ICsgICAgICAga2ZyZWUoYXJfcGNpLT5waXBlX2NvbmZpZyk7Cj4+ICsgICAgICAga2ZyZWUo
YXJfcGNpLT5zZXJ2X3RvX3BpcGUpOwo+Cj5JIHVuZGVyc3RhbmQgdGhhdCBhdGgxMGtfcGNpX3Jl
bGVhc2VfcmVzb3VyY2UoKSBpcyBub3QgZW50aXJlbHkKPnN5bW1ldHJpY2FsIHRvIGF0aDEwa19w
Y2lfc2V0dXBfcmVzb3VyY2UoKSBhbmQgdGVhcnMgZG93biBtb3JlIHRoYW4KPndoYXQgaGFzIGJl
ZW4gaW5pdGlhbGl6ZWQgYXQgdGhpcyBwb2ludC4gSG93ZXZlciwgd291bGQgaXQgYWN0dWFsbHkg
YmUKPnByb2JsZW1hdGljIHRvIHVzZSBhdGgxMGtfcGNpX3JlbGVhc2VfcmVzb3VyY2UoKSBpbiB0
aGVzZSBlcnJvciBwYXRocz8KPkZvciBleGFtcGxlLCBpcyB0aGVyZSBhbnkgaXNzdWUgd2l0aCBj
YWxsaW5nIGF0aDEwa19wY2lfY2VfZGVpbml0KCkKPndoZW4gdGhlIENFIGxheWVyIGhhcyBub3Qg
YmVlbiBmdWxseSBpbml0aWFsaXplZCB5ZXQ/IFVzaW5nIHRoZQo+ZXhpc3RpbmcgaGVscGVyIHdv
dWxkIGF2b2lkIGR1cGxpY2F0aW5nIHRoZSBjbGVhbnVwIGxvZ2ljIGFuZCBrZWVwIHRoZQo+cmVz
b3VyY2UgdGVhcmRvd24gY2VudHJhbGl6ZWQuCj4KPj4KPj4gIGVycl9jb3JlX2Rlc3Ryb3k6Cj4+
ICAgICAgICAgYXRoMTBrX2NvcmVfZGVzdHJveShhcik7Cj4+Cj4+IGJhc2UtY29tbWl0OiAwNTQ0
MWQ2OTdmN2Y5YTkyNzI2NGY0MDU4Y2JiYzZhMDNkZmNhYzlkCj4+Cgo+CgpJIGNoZWNrZWQgdGhl
IGV4aXN0aW5nIGhlbHBlcnM6CmF0aDEwa19wY2lfZnJlZV9waXBlcygpIG9ubHkgZnJlZXMgdGhl
IHBpcGVzOyB0aGUgdGhyZWUgYXJyYXlzIGFyZQpmcmVlZCBzZXBhcmF0ZWx5IGJ5IGF0aDEwa19w
Y2lfcmVsZWFzZV9yZXNvdXJjZSgpLgoKVGhlIGNvbmNyZXRlIGlzc3VlIHdpdGggcmV1c2luZyB0
aGUgbGF0dGVyIHVuY2hhbmdlZCBpcyBNTUlPIGFjY2VzczoKYXRoMTBrX3BjaV9jZV9kZWluaXQo
KSByZWFkcyBhbmQgd3JpdGVzIENFIHJlZ2lzdGVycyB0aHJvdWdoCmF0aDEwa19jZV9kZWluaXRf
cGlwZSgpLiBJZiBwY2lfaW9tYXAoKSBmYWlscyBpbiBhdGgxMGtfcGNpX2NsYWltKCksCnRoZXJl
IGlzIG5vIHZhbGlkIG1hcHBpbmcuIFBhdGhzIHRocm91Z2ggZXJyX3NsZWVwIGhhdmUgYWxzbyBh
bHJlYWR5CnVubWFwcGVkIHRoZSBCQVIgYmVmb3JlIHJlYWNoaW5nIGVycl9mcmVlX3BpcGVzLgoK
SSBhZ3JlZSB0aGF0IHRlYXJkb3duIHNob3VsZCBzdGF5IGNlbnRyYWxpemVkLiBJIHByb3Bvc2Ug
ZXh0cmFjdGluZwp0aGUgcGlwZSBhbmQgYXJyYXkgZnJlZXMgaW50byBhIG1lbW9yeS1vbmx5IGhl
bHBlciwgc2hhcmVkIGJ5CmF0aDEwa19wY2lfcmVsZWFzZV9yZXNvdXJjZSgpIGFuZCB0aGUgZWFy
bHkgZXJyb3IgcGF0aHMsIHdoaWxlCnByZXNlcnZpbmcgdGhlIGV4aXN0aW5nIGhhcmR3YXJlIGNs
ZWFudXAgb3JkZXJpbmcuCgpXb3VsZCB0aGlzIGFwcHJvYWNoIHdvcmsgZm9yIHlvdT8gSWYgc28s
IEknbGwgc2VuZCB2Mi4KCkJlc3QgcmVnYXJkcywKR3VhbmdzaHVv

