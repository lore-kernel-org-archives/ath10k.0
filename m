Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from esa5.dell-outbound.iphmx.com ([68.232.153.95])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bPltY-0006fc-Ic
 for ath10k@lists.infradead.org; Wed, 20 Jul 2016 07:26:17 +0000
From: <Perry_Yuan@Dell.com>
Date: Wed, 20 Jul 2016 15:23:16 +0800
Subject: RE: ath10k fail to load firmware
Message-ID: <A3D794F1192BBF449DF2EC3D7EE263F44A5402F315@SHAX7MCDC101.APAC.DELL.COM>
References: <20160719070932.GA2751@redhat.com>
 <CA+BoTQn98UFuGT0NntdE1HgG9UmmwzS=JsGkLmeGoMHSFGyDRg@mail.gmail.com>
 <20160719072754.GB2751@redhat.com>
 <A3D794F1192BBF449DF2EC3D7EE263F44A5402F0C8@SHAX7MCDC101.APAC.DELL.COM>
 <CA+BoTQn4T+4zMrJEbLBfu92w=mVqWBZZkZaYaW__V2_-VLkCyQ@mail.gmail.com>
 <A3D794F1192BBF449DF2EC3D7EE263F44A5402F107@SHAX7MCDC101.APAC.DELL.COM>
 <CA+BoTQk7QKaO2yxMq5JEhrBhn4WtpmWTcOxfiXcvYxrFvaxdgw@mail.gmail.com>
 <20160719092727.GD2751@redhat.com>
 <A3D794F1192BBF449DF2EC3D7EE263F44A5402F23C@SHAX7MCDC101.APAC.DELL.COM>
 <CA+BoTQk_R9sv4-wXGLOt-JzP+3PqSHeyMEweGEXAv84HjJPp3Q@mail.gmail.com>
In-Reply-To: <CA+BoTQk_R9sv4-wXGLOt-JzP+3PqSHeyMEweGEXAv84HjJPp3Q@mail.gmail.com>
Content-Language: en-US
MIME-Version: 1.0
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
To: michal.kazior@tieto.com
Cc: kvalo@qca.qualcomm.com, Yijun_Shen@Dell.com, sgruszka@redhat.com, ath10k@lists.infradead.org, Jared_Dominguez@DELL.com

RGVsbCAtIEludGVybmFsIFVzZSAtIENvbmZpZGVudGlhbCANCg0KSGkgTWljaGFsOg0KSSB3aWxs
ICBjb250YWN0IHdpdGggV2luZG93cyBkcml2ZXIgdGVhbSB0byBnZXQgdGhlIHJpZ2h0IGJvYXJk
LTIuYmluIGZpbGUgLg0KVGhhbmtzIGEgbG90IC4NCg0Ka2VlcCB1cCB0aGUgZ29vZCB3b3JrDQpQ
ZXJyecKgIFl1YW4NCkRlbGwgfCBDbGllbnQgU29mdHdhcmUgR3JvdXAgfCBQbGF0Zm9ybSBTZnR3
ciBTZW5pb3IgRW5naW5lZXINCm9mZmljZSArODYgMjEgMjIwMzA2ODksIG1vYmlsZSArODYgMTg1
MjE1MTI4MjMNCnBlcnJ5X3l1YW5AZGVsbC5jb20NClBsZWFzZSBjb25zaWRlciB0aGUgZW52aXJv
bm1lbnQgYmVmb3JlIHByaW50aW5nIHRoaXMgZW1haWwuDQoNCg0KLS0tLS1PcmlnaW5hbCBNZXNz
YWdlLS0tLS0NCkZyb206IE1pY2hhbCBLYXppb3IgW21haWx0bzptaWNoYWwua2F6aW9yQHRpZXRv
LmNvbV0gDQpTZW50OiBXZWRuZXNkYXksIEp1bHkgMjAsIDIwMTYgMjo1OCBQTQ0KVG86IFl1YW4s
IFBlcnJ5IDxQZXJyeV9ZdWFuQERlbGwuY29tPg0KQ2M6IFN0YW5pc2xhdyBHcnVzemthIDxzZ3J1
c3prYUByZWRoYXQuY29tPjsgS2FsbGUgVmFsbyA8a3ZhbG9AcWNhLnF1YWxjb21tLmNvbT47IGF0
aDEwa0BsaXN0cy5pbmZyYWRlYWQub3JnOyBTaGVuLCBZaWp1biA8WWlqdW5fU2hlbkBEZWxsLmNv
bT47IERvbWluZ3VleiwgSmFyZWQgPEphcmVkX0RvbWluZ3VlekBERUxMLmNvbT4NClN1YmplY3Q6
IFJlOiBhdGgxMGsgZmFpbCB0byBsb2FkIGZpcm13YXJlDQoNCkhpIFBlcnJ5LA0KDQpJJ3ZlIGJl
ZW4gdG9sZCB0aGF0IERlbGwgYXBwYXJlbnRseSBtYWludGFpbnMgdGhlaXIgc3Vic3lzdGVtIGlk
cyBpbmRlcGVuZGVudGx5IChmcm9tIFFDQSkuIFlvdSBzaG91bGQgcHJvYmFibHkgYXNrIHlvdXIg
V2luZG93cyBkcml2ZXIgdGVhbSAob3Igd2hvZXZlciBpcyByZXNwb25zaWJsZSBmb3IgdGhlIHN1
YnN5c3RlbSBpZCBzdHVmZiBhdCBEZWxsKSBmb3Igc3Vic3lzdGVtIGlkcyBhbmQgYm9hcmQvZWVw
cm9tIGZpbGVzIGFzc29jaWF0ZWQgd2l0aCB0aGVtIGFuZCB0aGVuIHByb3ZpZGUgdGhlbSBvbiBh
dGgxMGsgbWFpbGluZyBsaXN0IHNvIEthbGxlIGNhbiBhZGQgdGhlbSB0byBib2FyZC0yLmJpbi4N
Cg0KDQpNaWNoYcWCDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwphdGgxMGsgbWFpbGluZyBsaXN0CmF0aDEwa0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTBrCg==
