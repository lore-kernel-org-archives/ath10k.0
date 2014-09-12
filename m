Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XSTdj-0003lM-At
 for ath10k@lists.infradead.org; Fri, 12 Sep 2014 16:24:03 +0000
Message-ID: <54131E0D.3010903@candelatech.com>
Date: Fri, 12 Sep 2014 09:23:41 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: Change the number of active antennas (RF-chains)
References: <CANzpp-k2QdD6C9VJF7hPR2sKOQwhXxxA4qsJcihjKVrwgtXQng@mail.gmail.com>
 <5411AFE7.8060008@candelatech.com>
 <AFAC18488DA64ACD88984878834DF25A@mwnl.snu.ac.kr>
In-Reply-To: <AFAC18488DA64ACD88984878834DF25A@mwnl.snu.ac.kr>
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
To: Okhwan Lee <ohlee@mwnl.snu.ac.kr>
Cc: ath10k@lists.infradead.org

T24gMDkvMTEvMjAxNCAwODo0OCBQTSwgT2tod2FuIExlZSB3cm90ZToKPiBIaSwgIAo+IAo+IFRo
YW5rIHlvdSBmb3IgeW91ciBhbnN3ZXIuICAKPiBJIHVzZSAzLjE2LjEga2VybmVsIHZlcnNpb24s
ICAzLjE2LjEgYmFja3BvcnQgdmVyc2lvbiBhbmQgMTAuMS40NjcuMi0xIGZpcm13YXJlIHZlcnNp
b24uICAKPiBJIGFtIGN1cmlvdXMgdG8ga25vdyB5b3VyIHRlc3RpbmcuICAKPiAKPiBUaGlzIGlz
IG15IHRlc3QgYmFzaC1zY3JpcHQuCj4gCj4gIyMjIyMjIyMjIyMgdGVzdC5zaCAjIyMjIyMjIyMj
Iwo+IAo+ICMhL3Vzci9iaW4vc3VkbyAvYmluL2Jhc2gKPiBybW1vZCBhdGgxMGtfcGNpIGF0aDEw
a19jb3JlIGF0aCBtYWM4MDIxMSBjZmc4MDIxMQo+IG1vZHByb2JlIGF0aDEwa19wY2kgIAo+IGlm
Y29uZmlnIHdsYW4wIDI+L2Rldi9udWxsIDE+L2Rldi9udWxsCj4gd2hpbGUgWyAkPyAtbmUgMCBd
ICAKPiBkbwo+IGlmY29uZmlnIHdsYW4wIDI+L2Rldi9udWxsIDE+L2Rldi9udWxsCj4gZG9uZQoK
V2hhdCBhcmUgdGhlIGNvbW1hbmRzIGFib3ZlIHN1cHBvc2VkIHRvIGJlIGRvaW5nPwoKPiBlY2hv
IDB4MTIgPiAvc3lzL21vZHVsZS9hdGgxMGtfY29yZS9wYXJhbWV0ZXJzL2RlYnVnX21hc2sKPiBp
dyBkZXYgd2xhbjAgaW50ZXJmYWNlIGFkZCBtb24wIHR5cGUgbW9uaXRvcgo+IGl3IG1vbjAgc2V0
IGZyZXEgNTE4MCA4MCA1MjEwCj4gaWZjb25maWcgbW9uMCB1cAo+IAo+IAo+IAo+ICMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMKPiAKPiB0aGVuIOKApiB0eXBlIHRoZSBmb2xsb3dpbmcgY29tbWFuZCBp
biBzaGVsbCBwcm9tcHQgIAo+IAo+IGVjaG8gMHgxID4gL3N5cy9rZXJuZWwvZGVidWcvaWVlZTgw
MjExL3BoeSovYXRoMTBrL3J4X2NoYWlubWFzawo+IGVjaG8gMHg3ID4gL3N5cy9rZXJuZWwvZGVi
dWcvaWVlZTgwMjExL3BoeSovYXRoMTBrL3J4X2NoYWlubWFzawoKWW91IHNob3VsZCBiZSBhYmxl
IHRvIGNvbmZpZ3VyZSB0aGlzIHVzaW5nICdpdycKCkFuZCwgeW91IHByb2JhYmx5IG5lZWQgdG8g
Y29uZmlndXJlIHRoZSBjaGFpbm1hc2sgYmVmb3JlCmNyZWF0aW5nIG9yIHN0YXJ0aW5nIHRoZSB3
bGFuIGFuZCBvdGhlciB2aWZzLgoKVGhhbmtzLApCZW4KCi0tIApCZW4gR3JlZWFyIDxncmVlYXJi
QGNhbmRlbGF0ZWNoLmNvbT4KQ2FuZGVsYSBUZWNobm9sb2dpZXMgSW5jICBodHRwOi8vd3d3LmNh
bmRlbGF0ZWNoLmNvbQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmF0aDEwayBtYWlsaW5nIGxpc3QKYXRoMTBrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMGsK
