Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bhBtA-0007iU-Mo
 for ath10k@lists.infradead.org; Tue, 06 Sep 2016 08:37:53 +0000
From: "Shajakhan, Mohammed Shafi (Mohammed Shafi)" <mohammed@qti.qualcomm.com>
Subject: Re: [v5] ath10k: Fix broken NULL func data frame status for 10.4
Date: Tue, 6 Sep 2016 08:37:22 +0000
Message-ID: <1473151041373.34060@qti.qualcomm.com>
References: <1472199140-8404-1-git-send-email-mohammed@qca.qualcomm.com>,
 <48c9092d7f6c468092ef093779624a36@euamsexm01a.eu.qualcomm.com>
In-Reply-To: <48c9092d7f6c468092ef093779624a36@euamsexm01a.eu.qualcomm.com>
Content-Language: en-IN
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
To: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Cc: "mohammed@codeaurora.org" <mohammed@codeaurora.org>, "Raja,
 Tamizh Chelvam" <c_traja@qti.qualcomm.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Hi Kalle,

please revert this patch, Raj suggested this patch introduced a regression in sending NULL func frames :(

We will fix the wrong tx status report for NULL func frames appropriately
(if needed in ath10k firmware)
Sorry for the regression, kindly revert it until a proper fix is figured out.

regards,
shafi
________________________________________
From: Valo, Kalle
Sent: 02 September 2016 21:30
To: Shajakhan, Mohammed Shafi (Mohammed Shafi)
Cc: ath10k@lists.infradead.org; mohammed@codeaurora.org; Raja, Tamizh Chelvam; linux-wireless@vger.kernel.org; Shajakhan, Mohammed Shafi (Mohammed Shafi)
Subject: Re: [v5] ath10k: Fix broken NULL func data frame status for 10.4

Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com> wrote:
> From: Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>
>
> Older firmware with HTT delivers incorrect tx status for null func
> frames to driver, but this fixed in 10.2 and 10.4 firmware versions.
> Also this workaround results in reporting of incorrect null func status
> for 10.4. Fix this is by introducing a firmware feature flag for 10.4
> so that this workaround is skipped and proper tx status for null func
> frames are reported
>
> Signed-off-by: Tamizh chelvam <c_traja@qti.qualcomm.com>
> Signed-off-by: Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>

Thanks, 1 patch applied to ath-next branch of ath.git:

2cdce425aa33 ath10k: Fix broken NULL func data frame status for 10.4

--
Sent by pwcli
https://patchwork.kernel.org/patch/9300961/


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
