Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dGPeq-0002bX-U0
 for ath10k@lists.infradead.org; Thu, 01 Jun 2017 12:56:58 +0000
MIME-Version: 1.0
Subject: Re: [1/3] ath10k: Increase BMI timeout.
From: Kalle Valo <kvalo@qca.qualcomm.com>
In-Reply-To: <1494883540-18558-1-git-send-email-greearb@candelatech.com>
References: <1494883540-18558-1-git-send-email-greearb@candelatech.com>
Message-ID: <82fb5cc6778542eeaecd9e5ae575590b@eusanexr01a.eu.qualcomm.com>
Date: Thu, 1 Jun 2017 05:56:31 -0700
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
To: Ben Greear <greearb@candelatech.com>
Cc: ath10k@lists.infradead.org

Ben Greear <greearb@candelatech.com> wrote:

> When testing a 9888 chipset NIC, I notice it often takes
> almost 2 seconds, and then many times OTP fails, probably due
> to the two-second timeout.
> 
> [ 2269.841842] ath10k_pci 0000:05:00.0: bmi cmd took: 1984 jiffies (HZ: 1000), rv: 0
> [ 2273.608185] ath10k_pci 0000:05:00.0: bmi cmd took: 1986 jiffies (HZ: 1000), rv: 0
> [ 2277.294732] ath10k_pci 0000:05:00.0: bmi cmd took: 1989 jiffies (HZ: 1000), rv: 0
> 
> So, increase the BMI timeout to 3 seconds.
> 
> Signed-off-by: Ben Greear <greearb@candelatech.com>
> Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>

2 patches applied to ath-next branch of ath.git, thanks.

13c3b26a71df ath10k: increase BMI timeout
6bb099b088c7 ath10k: log when longer bmi cmds happen

-- 
https://patchwork.kernel.org/patch/9727989/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
