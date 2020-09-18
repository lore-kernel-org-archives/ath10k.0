Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
From: <ansuelsmth@gmail.com>
References: <20200918162928.14335-1-ansuelsmth@gmail.com>
 <20200918162928.14335-2-ansuelsmth@gmail.com>
 <8f886e3d-e2ee-cbf8-a676-28ebed4977aa@gmail.com>
In-Reply-To: <8f886e3d-e2ee-cbf8-a676-28ebed4977aa@gmail.com>
Subject: R: [PATCH 2/2] dt: bindings: ath10k: Document qcom,
 ath10k-pre-calibration-data-mtd
Date: Fri, 18 Sep 2020 20:31:18 +0200
Message-ID: <000001d68de9$e7916450$b6b42cf0$@gmail.com>
MIME-Version: 1.0
Content-Language: it
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
To: 'Christian Lamparter' <chunkeey@gmail.com>, 'Kalle Valo' <kvalo@codeaurora.org>
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org, 'Bartosz Golaszewski' <bgolaszewski@baylibre.com>, 'Srinivas Kandagatla' <srinivas.kandagatla@linaro.org>, 'Rob Herring' <robh+dt@kernel.org>, linux-mtd@lists.infradead.org, 'Jakub Kicinski' <kuba@kernel.org>, "'David S. Miller'" <davem@davemloft.net>

Cgo+IC0tLS0tTWVzc2FnZ2lvIG9yaWdpbmFsZS0tLS0tCj4gRGE6IENocmlzdGlhbiBMYW1wYXJ0
ZXIgPGNodW5rZWV5QGdtYWlsLmNvbT4KPiBJbnZpYXRvOiB2ZW5lcmTDrCAxOCBzZXR0ZW1icmUg
MjAyMCAxODo1NAo+IEE6IEFuc3VlbCBTbWl0aCA8YW5zdWVsc210aEBnbWFpbC5jb20+OyBLYWxs
ZSBWYWxvCj4gPGt2YWxvQGNvZGVhdXJvcmEub3JnPgo+IENjOiBkZXZpY2V0cmVlQHZnZXIua2Vy
bmVsLm9yZzsgbmV0ZGV2QHZnZXIua2VybmVsLm9yZzsgbGludXgtCj4gd2lyZWxlc3NAdmdlci5r
ZXJuZWwub3JnOyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnOwo+IGF0aDEwa0BsaXN0cy5p
bmZyYWRlYWQub3JnOyBEYXZpZCBTLiBNaWxsZXIgPGRhdmVtQGRhdmVtbG9mdC5uZXQ+OyBSb2IK
PiBIZXJyaW5nIDxyb2JoK2R0QGtlcm5lbC5vcmc+OyBKYWt1YiBLaWNpbnNraSA8a3ViYUBrZXJu
ZWwub3JnPjsgbGludXgtCj4gbXRkQGxpc3RzLmluZnJhZGVhZC5vcmc7IFNyaW5pdmFzIEthbmRh
Z2F0bGEKPiA8c3Jpbml2YXMua2FuZGFnYXRsYUBsaW5hcm8ub3JnPjsgQmFydG9zeiBHb2xhc3pl
d3NraQo+IDxiZ29sYXN6ZXdza2lAYmF5bGlicmUuY29tPgo+IE9nZ2V0dG86IFJlOiBbUEFUQ0gg
Mi8yXSBkdDogYmluZGluZ3M6IGF0aDEwazogRG9jdW1lbnQgcWNvbSwgYXRoMTBrLQo+IHByZS1j
YWxpYnJhdGlvbi1kYXRhLW10ZAo+IAo+IE9uIDIwMjAtMDktMTggMTg6MjksIEFuc3VlbCBTbWl0
aCB3cm90ZToKPiA+IERvY3VtZW50IHVzZSBvZiBxY29tLGF0aDEway1wcmUtY2FsaWJyYXRpb24t
ZGF0YS1tdGQgYmluZGluZ3MgdXNlZCB0bwo+ID4gZGVmaW5lIGZyb20gd2hlcmUgdGhlIGRyaXZl
ciB3aWxsIGxvYWQgdGhlIHByZS1jYWwgZGF0YSBpbiB0aGUgZGVmaW5lZAo+ID4gbXRkIHBhcnRp
dGlvbi4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBBbnN1ZWwgU21pdGggPGFuc3VlbHNtdGhAZ21h
aWwuY29tPgo+IAo+IFE6IERvZXNuJ3QgbXRkIG5vdyBjb21lIHdpdGggbnZtZW0gc3VwcG9ydCBm
cm9tIHRoZSBnZXQgZ28/IFNvCj4gdGhlIE1BQy1BZGRyZXNzZXMgYW5kIHByZS1jYWxkYXRhIGNv
dWxkIGJlIHNwZWNpZmllZCBhcyBhCj4gbnZtZW0tbm9kZSBpbiB0aGUgZGV2aWNldHJlZT8gSSBy
ZW1lbWJlciBzZWVpbmcgdGhhdCB0aGlzIHdhcwo+IHdvcmtlZCBvbiBvciB3YXMgdGhpcyBtdGQt
Pm52bWVtIGRyb3BwZWQ/Cj4gCj4gQ2hlZXJzLAo+IENocmlzdGlhbgoKU29ycnkgYSBsb3QgZm9y
IHRoZSBkb3VibGUgZW1haWwuLi4gSSB0aGluayBJIGZvdW5kIHdoYXQgeW91IGFyZSB0YWxraW5n
IGFib3V0LgpJdCBsb29rcyBsaWtlIHRoZSBjb2RlIHdhcyBtZXJnZWQgYnV0IG5vdCB0aGUgZG9j
dW1lbnRhdGlvbi4KV2lsbCBkbyBzb21lIHRlc3QgYW5kIGNoZWNrIGlmIHRoaXMgd29ya3MuCgpU
aGlzIHNob3VsZCBiZSB0aGUgcmVsYXRlZCBwYXRjaC4KaHR0cHM6Ly9wYXRjaHdvcmsub3psYWJz
Lm9yZy9wcm9qZWN0L2xpbnV4LW10ZC9wYXRjaC8xNTIxOTMzODk5LTM2Mi00LWdpdC1zZW5kLWVt
YWlsLWFsYmV1QGZyZWUuZnIvCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmF0aDEwayBtYWlsaW5nIGxpc3QKYXRoMTBrQGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMGsK
