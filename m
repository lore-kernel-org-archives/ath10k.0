Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k53gQ-0006wr-9f
 for ath10k@lists.infradead.org; Mon, 10 Aug 2020 09:01:31 +0000
Date: Mon, 10 Aug 2020 11:01:26 +0200
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
Subject: CVE-2020-3702: Firmware updates for ath9k and ath10k chips
Message-ID: <20200810090126.mtu3uocpcjg5se5e@pali>
MIME-Version: 1.0
Content-Disposition: inline
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: ath10k@lists.infradead.org, ath9k-devel@qca.qualcomm.com, linux-wireless@vger.kernel.org, Kalle Valo <kvalo@codeaurora.org>

Hello!

ESET engineers on their blog published some information about new
security vulnerability CVE-2020-3702 in ath9k wifi cards:
https://www.welivesecurity.com/2020/08/06/beyond-kr00k-even-more-wifi-chips-vulnerable-eavesdropping/

According to Qualcomm security bulletin this CVE-2020-3702 affects also
some Qualcomm IPQ chips which are handled by ath10k driver:
https://www.qualcomm.com/company/product-security/bulletins/august-2020-security-bulletin#_cve-2020-3702

Kalle, could you or other people from Qualcomm provide updated and fixed
version of ath9k and ath10k firmwares in linux-firmware git repository?

According to Qualcomm security bulletin this issue has Critical security
rating, so I think fixed firmware files should be updated also in stable
releases of linux distributions.

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
