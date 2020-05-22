Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
From: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>
Subject: [PATCH 02/11] mmc: sdio: Change macro names for Marvell 8688 modules
Date: Fri, 22 May 2020 16:44:03 +0200
Message-Id: <20200522144412.19712-3-pali@kernel.org>
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

QWRkIHVuZGVyc2NvcmUgYXMgc2VwYXJhdG9yIGluIE1hcnZlbGwgODY4OCBtYWNybyBuYW1lcyBm
b3IgYmV0dGVyCnJlYWRhYmlsaXR5IGFuZCBjb25zaXN0ZW5jeS4KClNpZ25lZC1vZmYtYnk6IFBh
bGkgUm9ow6FyIDxwYWxpQGtlcm5lbC5vcmc+Ci0tLQogZHJpdmVycy9uZXQvd2lyZWxlc3MvbWFy
dmVsbC9saWJlcnRhcy9pZl9zZGlvLmMgfCAyICstCiBpbmNsdWRlL2xpbnV4L21tYy9zZGlvX2lk
cy5oICAgICAgICAgICAgICAgICAgICB8IDQgKystLQogMiBmaWxlcyBjaGFuZ2VkLCAzIGluc2Vy
dGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9uZXQvd2lyZWxl
c3MvbWFydmVsbC9saWJlcnRhcy9pZl9zZGlvLmMgYi9kcml2ZXJzL25ldC93aXJlbGVzcy9tYXJ2
ZWxsL2xpYmVydGFzL2lmX3NkaW8uYwppbmRleCBhY2Y2MWI5M2I3ODIuLjQ0ZmJkMGFjYjg3YSAx
MDA2NDQKLS0tIGEvZHJpdmVycy9uZXQvd2lyZWxlc3MvbWFydmVsbC9saWJlcnRhcy9pZl9zZGlv
LmMKKysrIGIvZHJpdmVycy9uZXQvd2lyZWxlc3MvbWFydmVsbC9saWJlcnRhcy9pZl9zZGlvLmMK
QEAgLTY1LDcgKzY1LDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBzZGlvX2RldmljZV9pZCBpZl9z
ZGlvX2lkc1tdID0gewogCXsgU0RJT19ERVZJQ0UoU0RJT19WRU5ET1JfSURfTUFSVkVMTCwKIAkJ
CVNESU9fREVWSUNFX0lEX01BUlZFTExfTElCRVJUQVMpIH0sCiAJeyBTRElPX0RFVklDRShTRElP
X1ZFTkRPUl9JRF9NQVJWRUxMLAotCQkJU0RJT19ERVZJQ0VfSURfTUFSVkVMTF84Njg4V0xBTikg
fSwKKwkJCVNESU9fREVWSUNFX0lEX01BUlZFTExfODY4OF9XTEFOKSB9LAogCXsgLyogZW5kOiBh
bGwgemVyb2VzICovCQkJCX0sCiB9OwogCmRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L21tYy9z
ZGlvX2lkcy5oIGIvaW5jbHVkZS9saW51eC9tbWMvc2Rpb19pZHMuaAppbmRleCA5NmY0M2UwZGM3
OGYuLjdlOTkyYTBlNmNjMCAxMDA2NDQKLS0tIGEvaW5jbHVkZS9saW51eC9tbWMvc2Rpb19pZHMu
aAorKysgYi9pbmNsdWRlL2xpbnV4L21tYy9zZGlvX2lkcy5oCkBAIC01Niw4ICs1Niw4IEBACiAK
ICNkZWZpbmUgU0RJT19WRU5ET1JfSURfTUFSVkVMTAkJCTB4MDJkZgogI2RlZmluZSBTRElPX0RF
VklDRV9JRF9NQVJWRUxMX0xJQkVSVEFTCQkweDkxMDMKLSNkZWZpbmUgU0RJT19ERVZJQ0VfSURf
TUFSVkVMTF84Njg4V0xBTgkJMHg5MTA0Ci0jZGVmaW5lIFNESU9fREVWSUNFX0lEX01BUlZFTExf
ODY4OEJUCQkweDkxMDUKKyNkZWZpbmUgU0RJT19ERVZJQ0VfSURfTUFSVkVMTF84Njg4X1dMQU4J
MHg5MTA0CisjZGVmaW5lIFNESU9fREVWSUNFX0lEX01BUlZFTExfODY4OF9CVAkJMHg5MTA1CiAj
ZGVmaW5lIFNESU9fREVWSUNFX0lEX01BUlZFTExfODc5N19GMAkJMHg5MTI4CiAjZGVmaW5lIFNE
SU9fREVWSUNFX0lEX01BUlZFTExfODg4N19GMAkJMHg5MTM0CiAKLS0gCjIuMjAuMQoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmF0aDEwayBtYWlsaW5n
IGxpc3QKYXRoMTBrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMGsK
