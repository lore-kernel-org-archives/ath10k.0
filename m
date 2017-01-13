Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([5.9.151.49] helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cRwE5-0008Il-IF
 for ath10k@lists.infradead.org; Fri, 13 Jan 2017 07:24:44 +0000
Message-ID: <1484292252.19860.5.camel@sipsolutions.net>
Subject: Re: [PATCH] ath10k: prevent sta pointer rcu violation
From: Johannes Berg <johannes@sipsolutions.net>
Date: Fri, 13 Jan 2017 08:24:12 +0100
In-Reply-To: <CA+BoTQkgD5umVsGnRM4uu_8GO=KjQ6MuJCjQRnSHrDuQdU4z1w@mail.gmail.com>
 (sfid-20170112_171858_779498_B3B00B28)
References: <1484234070-7431-1-git-send-email-michal.kazior@tieto.com>
 <1484235986.19860.1.camel@sipsolutions.net>
 <CA+BoTQkgD5umVsGnRM4uu_8GO=KjQ6MuJCjQRnSHrDuQdU4z1w@mail.gmail.com>
 (sfid-20170112_171858_779498_B3B00B28)
Mime-Version: 1.0
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
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Michal Kazior <michal.kazior@tieto.com>
Cc: Kalle Valo <kvalo@qca.qualcomm.com>, linux-wireless <linux-wireless@vger.kernel.org>, Ben Greear <greearb@candelatech.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>

Cj4gVW5sZXNzIHlvdSB0aGVuIGNvbnRpbnVlIHRvIHVzZSB0aGF0IHN0YSBwb2ludGVyIGFmdGVy
IHlvdSByZWxlYXNlCj4gZGF0YV9sb2NrLgoKT3VjaCwgb2suIFRoYXQncyByYXRoZXIgc3RyYW5n
ZWx5IGhpZGRlbiB0aG91Z2guCgo+IENvbnNpZGVyIHRoaXM6Cj4gCj4gPiDCoMKgwqDCoMKgwqDC
oMKgwqBDUFUwwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBDUFUxCj4gPiAxwqDCoMKgc3luY2hy
b25pemVfbmV0KCkKPiA+IDLCoMKgwqDCoGRydl9zdGFfc3RhdGUoKQo+ID4gM8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaHR0X2ZldGNoX2luZChwaWQsdGlkKSBj
YWxsZWQKPiA+IDTCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJj
dV9yZWFkX2xvY2soKQo+ID4gNcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgZ2V0KGRhdGFfbG9jaykKPiA+IDbCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoHR4cT1wZWVyc1twaWRdLT5zdGEtPnR4cVt0aWRdCj4gPiA3wqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBwdXQoZGF0YV9sb2NrKQo+ID4gOMKg
wqDCoMKgZ2V0KGRhdGFfbG9jaykKPiA+IDnCoMKgwqDCoMKgcGVlci0+c3RhPTAKPiA+IDEwwqDC
oMKgcHV0KGRhdGFfbG9jaykKPiA+IDExwqDCoMKgwqDCoGtmcmVlKHN0YSkKPiA+IDEywqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaWVlZTgwMjExX3R4X2RlcXVldWUo
dHhxKQo+IAo+IEV2ZW4gdGhvdWdoIHRoZXJlJ3Mgbm8gY29kZSBsaWtlICg5KSBwZXIgc2UgeW91
IGNhbiB0aGluayBvZiBpdCBhcwo+IGFueXRoaW5nIHRoYXQgdHJpZXMgdG8gInJlbW92ZSIgdGhl
IHBlZXItLXN0YSBhc3NvY2lhdGlvbgo+IChhdGgxMGtfcGVlcgo+IGlzIHJlbW92ZWQgaW1wbGlj
aXRseSB2aWEgd21pIHBlZXIgZGVsZXRlIGNvbW1hbmQgYW5kIHdhaXRpbmcgZm9yIGh0dAo+IGV2
ZW50IGNvbXBsZXRpb24pLgo+IAo+IEhvbGRpbmcgZGF0YV9sb2NrIGZvciB0aGUgZW50aXJlIGR1
cmF0aW9uIG9mIGhhbmRsaW5nIGZldGNoCj4gaW5kaWNhdGlvbiBpc24ndCByZWFsbHkgZ29vZCBm
b3IgcGVyZm9ybWFuY2Ugc28gaXQncyBiZXR0ZXIgdG8gZml4Cj4gUkNVIGhhbmRsaW5nLgoKWWVh
aCwgSSBzZWUgaXQgbm93IC0gYWxzbyB0aGUgY29tbWVudCB3aGVyZSB0aGlzIGhhcHBlbnMuIFlv
dSBwcm9iYWJseQpzaG91bGQgbWFyayBzb21lIHRoaW5ncyBfX3JjdSB0aG91Z2ggYW5kIGFjdHVh
bGx5IHVzZSBSQ1UgcHJpbWl0aXZlcywKc28gdGhlIGNvZGUgaXMgYWN0dWFsbHkgdW5kZXJzdGFu
ZGFibGUgOikKCmpvaGFubmVzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwphdGgxMGsgbWFpbGluZyBsaXN0CmF0aDEwa0BsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTBrCg==
