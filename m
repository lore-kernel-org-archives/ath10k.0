Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
From: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>
Subject: [PATCH 05/11] mmc: sdio: Move SDIO IDs from btmtksdio driver to
 common include file
Date: Fri, 22 May 2020 16:44:06 +0200
Message-Id: <20200522144412.19712-6-pali@kernel.org>
In-Reply-To: <20200522144412.19712-1-pali@kernel.org>
References: <20200522144412.19712-1-pali@kernel.org>
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
To: Ulf Hansson <ulf.hansson@linaro.org>, linux-mmc@vger.kernel.org
Cc: brcm80211-dev-list.pdl@broadcom.com, libertas-dev@lists.infradead.org, Xinming Hu <huxinming820@gmail.com>, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, Amitkumar Karwar <amitkarwar@gmail.com>, =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>, Ganapathi Bhat <ganapathi.bhat@nxp.com>, ath10k@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, brcm80211-dev-list@cypress.com, Kalle Valo <kvalo@codeaurora.org>, b43-dev@lists.infradead.org

RGVmaW5lIGFwcHJvcHJpYXRlIG1hY3JvIG5hbWVzIGZvciBjb25zaXN0ZW5jeSB3aXRoIG90aGVy
IG1hY3Jvcy4KClNpZ25lZC1vZmYtYnk6IFBhbGkgUm9ow6FyIDxwYWxpQGtlcm5lbC5vcmc+Ci0t
LQogZHJpdmVycy9ibHVldG9vdGgvYnRtdGtzZGlvLmMgfCA0ICsrLS0KIGluY2x1ZGUvbGludXgv
bW1jL3NkaW9faWRzLmggIHwgMiArKwogMiBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyks
IDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ibHVldG9vdGgvYnRtdGtzZGlv
LmMgYi9kcml2ZXJzL2JsdWV0b290aC9idG10a3NkaW8uYwppbmRleCA1MTk3ODhjNDQyY2EuLmJm
ZjA5NWJlMmY5NyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ibHVldG9vdGgvYnRtdGtzZGlvLmMKKysr
IGIvZHJpdmVycy9ibHVldG9vdGgvYnRtdGtzZGlvLmMKQEAgLTUxLDkgKzUxLDkgQEAgc3RhdGlj
IGNvbnN0IHN0cnVjdCBidG10a3NkaW9fZGF0YSBtdDc2NjhfZGF0YSA9IHsKIH07CiAKIHN0YXRp
YyBjb25zdCBzdHJ1Y3Qgc2Rpb19kZXZpY2VfaWQgYnRtdGtzZGlvX3RhYmxlW10gPSB7Ci0Je1NE
SU9fREVWSUNFKFNESU9fVkVORE9SX0lEX01FRElBVEVLLCAweDc2NjMpLAorCXtTRElPX0RFVklD
RShTRElPX1ZFTkRPUl9JRF9NRURJQVRFSywgU0RJT19ERVZJQ0VfSURfTUVESUFURUtfTVQ3NjYz
KSwKIAkgLmRyaXZlcl9kYXRhID0gKGtlcm5lbF91bG9uZ190KSZtdDc2NjNfZGF0YSB9LAotCXtT
RElPX0RFVklDRShTRElPX1ZFTkRPUl9JRF9NRURJQVRFSywgMHg3NjY4KSwKKwl7U0RJT19ERVZJ
Q0UoU0RJT19WRU5ET1JfSURfTUVESUFURUssIFNESU9fREVWSUNFX0lEX01FRElBVEVLX01UNzY2
OCksCiAJIC5kcml2ZXJfZGF0YSA9IChrZXJuZWxfdWxvbmdfdCkmbXQ3NjY4X2RhdGEgfSwKIAl7
IH0JLyogVGVybWluYXRpbmcgZW50cnkgKi8KIH07CmRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4
L21tYy9zZGlvX2lkcy5oIGIvaW5jbHVkZS9saW51eC9tbWMvc2Rpb19pZHMuaAppbmRleCAxMjM3
ZTEwNDhkMDYuLmM5YWNhNTdkNGRlYSAxMDA2NDQKLS0tIGEvaW5jbHVkZS9saW51eC9tbWMvc2Rp
b19pZHMuaAorKysgYi9pbmNsdWRlL2xpbnV4L21tYy9zZGlvX2lkcy5oCkBAIC04MCw2ICs4MCw4
IEBACiAjZGVmaW5lIFNESU9fREVWSUNFX0lEX01BUlZFTExfODk4N19CVAkJMHg5MTRhCiAKICNk
ZWZpbmUgU0RJT19WRU5ET1JfSURfTUVESUFURUsJCQkweDAzN2EKKyNkZWZpbmUgU0RJT19ERVZJ
Q0VfSURfTUVESUFURUtfTVQ3NjYzCQkweDc2NjMKKyNkZWZpbmUgU0RJT19ERVZJQ0VfSURfTUVE
SUFURUtfTVQ3NjY4CQkweDc2NjgKIAogI2RlZmluZSBTRElPX1ZFTkRPUl9JRF9TSUFOTwkJCTB4
MDM5YQogI2RlZmluZSBTRElPX0RFVklDRV9JRF9TSUFOT19OT1ZBX0IwCQkweDAyMDEKLS0gCjIu
MjAuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmF0
aDEwayBtYWlsaW5nIGxpc3QKYXRoMTBrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMGsK
