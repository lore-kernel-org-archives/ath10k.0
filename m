Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
From: Ganapathi Bhat <ganapathi.bhat@nxp.com>
Subject: RE: [EXT] [PATCH 01/11] mmc: sdio: Fix macro name for Marvell device
 with ID 0x9134
Date: Fri, 29 May 2020 03:28:59 +0000
Message-ID: <VI1PR04MB43668C84D84103D8F8B3EA428F8F0@VI1PR04MB4366.eurprd04.prod.outlook.com>
References: <20200522144412.19712-1-pali@kernel.org>
 <20200522144412.19712-2-pali@kernel.org>
In-Reply-To: <20200522144412.19712-2-pali@kernel.org>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: =?utf-8?B?UGFsaSBSb2jDoXI=?= <pali@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>
Cc: "brcm80211-dev-list.pdl@broadcom.com" <brcm80211-dev-list.pdl@broadcom.com>, "libertas-dev@lists.infradead.org" <libertas-dev@lists.infradead.org>, Xinming Hu <huxinming820@gmail.com>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Amitkumar Karwar <amitkarwar@gmail.com>, =?utf-8?B?TWFyZWsgQmVow7pu?= <marek.behun@nic.cz>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, Matthias Brugger <matthias.bgg@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, "brcm80211-dev-list@cypress.com" <brcm80211-dev-list@cypress.com>, Kalle Valo <kvalo@codeaurora.org>, "b43-dev@lists.infradead.org" <b43-dev@lists.infradead.org>

HI Pali,

> Kernel quirks for SDIO devices are
> matched against device ID from SDIO Common CIS. Therefore device ID used
> in quirk is correct, just has misleading name.


OK, understood. Thanks for the change.
Acked-by: Ganapathi Bhat <ganapathi.bhat@nxp.com>
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
