Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Subject: Re: [PATCH 05/11] mmc: sdio: Move SDIO IDs from btmtksdio driver to
 common include file
References: <20200522144412.19712-1-pali@kernel.org>
 <20200522144412.19712-6-pali@kernel.org>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <804fbad7-11ba-8d8b-d58e-3eb4e5cf2b41@gmail.com>
Date: Fri, 22 May 2020 17:02:11 +0200
MIME-Version: 1.0
In-Reply-To: <20200522144412.19712-6-pali@kernel.org>
Content-Language: en-US
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
To: =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, linux-mmc@vger.kernel.org
Cc: brcm80211-dev-list.pdl@broadcom.com, libertas-dev@lists.infradead.org, Xinming Hu <huxinming820@gmail.com>, Sean Wang <sean.wang@mediatek.com>, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, Amitkumar Karwar <amitkarwar@gmail.com>, =?UTF-8?Q?Marek_Beh=c3=ban?= <marek.behun@nic.cz>, Ganapathi Bhat <ganapathi.bhat@nxp.com>, ath10k@lists.infradead.org, Mauro Carvalho Chehab <mchehab@kernel.org>, brcm80211-dev-list@cypress.com, Kalle Valo <kvalo@codeaurora.org>, b43-dev@lists.infradead.org

CgpPbiAyMi8wNS8yMDIwIDE2OjQ0LCBQYWxpIFJvaMOhciB3cm90ZToKPiBEZWZpbmUgYXBwcm9w
cmlhdGUgbWFjcm8gbmFtZXMgZm9yIGNvbnNpc3RlbmN5IHdpdGggb3RoZXIgbWFjcm9zLgo+IAo+
IFNpZ25lZC1vZmYtYnk6IFBhbGkgUm9ow6FyIDxwYWxpQGtlcm5lbC5vcmc+CgpSZXZpZXdlZC1i
eTogTWF0dGhpYXMgQnJ1Z2dlciA8bWF0dGhpYXMuYmdnQGdtYWlsLmNvbT4KCj4gLS0tCj4gIGRy
aXZlcnMvYmx1ZXRvb3RoL2J0bXRrc2Rpby5jIHwgNCArKy0tCj4gIGluY2x1ZGUvbGludXgvbW1j
L3NkaW9faWRzLmggIHwgMiArKwo+ICAyIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwg
MiBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ibHVldG9vdGgvYnRtdGtz
ZGlvLmMgYi9kcml2ZXJzL2JsdWV0b290aC9idG10a3NkaW8uYwo+IGluZGV4IDUxOTc4OGM0NDJj
YS4uYmZmMDk1YmUyZjk3IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvYmx1ZXRvb3RoL2J0bXRrc2Rp
by5jCj4gKysrIGIvZHJpdmVycy9ibHVldG9vdGgvYnRtdGtzZGlvLmMKPiBAQCAtNTEsOSArNTEs
OSBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGJ0bXRrc2Rpb19kYXRhIG10NzY2OF9kYXRhID0gewo+
ICB9Owo+ICAKPiAgc3RhdGljIGNvbnN0IHN0cnVjdCBzZGlvX2RldmljZV9pZCBidG10a3NkaW9f
dGFibGVbXSA9IHsKPiAtCXtTRElPX0RFVklDRShTRElPX1ZFTkRPUl9JRF9NRURJQVRFSywgMHg3
NjYzKSwKPiArCXtTRElPX0RFVklDRShTRElPX1ZFTkRPUl9JRF9NRURJQVRFSywgU0RJT19ERVZJ
Q0VfSURfTUVESUFURUtfTVQ3NjYzKSwKPiAgCSAuZHJpdmVyX2RhdGEgPSAoa2VybmVsX3Vsb25n
X3QpJm10NzY2M19kYXRhIH0sCj4gLQl7U0RJT19ERVZJQ0UoU0RJT19WRU5ET1JfSURfTUVESUFU
RUssIDB4NzY2OCksCj4gKwl7U0RJT19ERVZJQ0UoU0RJT19WRU5ET1JfSURfTUVESUFURUssIFNE
SU9fREVWSUNFX0lEX01FRElBVEVLX01UNzY2OCksCj4gIAkgLmRyaXZlcl9kYXRhID0gKGtlcm5l
bF91bG9uZ190KSZtdDc2NjhfZGF0YSB9LAo+ICAJeyB9CS8qIFRlcm1pbmF0aW5nIGVudHJ5ICov
Cj4gIH07Cj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvbW1jL3NkaW9faWRzLmggYi9pbmNs
dWRlL2xpbnV4L21tYy9zZGlvX2lkcy5oCj4gaW5kZXggMTIzN2UxMDQ4ZDA2Li5jOWFjYTU3ZDRk
ZWEgMTAwNjQ0Cj4gLS0tIGEvaW5jbHVkZS9saW51eC9tbWMvc2Rpb19pZHMuaAo+ICsrKyBiL2lu
Y2x1ZGUvbGludXgvbW1jL3NkaW9faWRzLmgKPiBAQCAtODAsNiArODAsOCBAQAo+ICAjZGVmaW5l
IFNESU9fREVWSUNFX0lEX01BUlZFTExfODk4N19CVAkJMHg5MTRhCj4gIAo+ICAjZGVmaW5lIFNE
SU9fVkVORE9SX0lEX01FRElBVEVLCQkJMHgwMzdhCj4gKyNkZWZpbmUgU0RJT19ERVZJQ0VfSURf
TUVESUFURUtfTVQ3NjYzCQkweDc2NjMKPiArI2RlZmluZSBTRElPX0RFVklDRV9JRF9NRURJQVRF
S19NVDc2NjgJCTB4NzY2OAo+ICAKPiAgI2RlZmluZSBTRElPX1ZFTkRPUl9JRF9TSUFOTwkJCTB4
MDM5YQo+ICAjZGVmaW5lIFNESU9fREVWSUNFX0lEX1NJQU5PX05PVkFfQjAJCTB4MDIwMQo+IAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYXRoMTBrIG1h
aWxpbmcgbGlzdAphdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0aDEwawo=
