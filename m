Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XS5Fq-00067X-UY
 for ath10k@lists.infradead.org; Thu, 11 Sep 2014 14:21:47 +0000
Message-ID: <5411AFE7.8060008@candelatech.com>
Date: Thu, 11 Sep 2014 07:21:27 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: Change the number of active antennas (RF-chains)
References: <CANzpp-k2QdD6C9VJF7hPR2sKOQwhXxxA4qsJcihjKVrwgtXQng@mail.gmail.com>
In-Reply-To: <CANzpp-k2QdD6C9VJF7hPR2sKOQwhXxxA4qsJcihjKVrwgtXQng@mail.gmail.com>
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Okhwan Lee <ohlee@mwnl.snu.ac.kr>, ath10k@lists.infradead.org

On 09/11/2014 12:37 AM, Okhwan Lee wrote:
> Hi,
>
> I have been trying to configure the number of active antennas (not
> spatial stream) by using ath10k/QCA9880.
>
> When I use ath9k, we can easily change the number of active antenna by
> using REG_WRITE(ah, AR_PHY_RX_CHAINMASK, ah->rxchainmask) function
> used in ar9003_hw_set_chain_masks.
>
> However, in ath10k, we failed to handle the values (e.g, rx/tx chain
> mask of QCA9880) by using ath10k_wmi_pdev_set_param(ar,
> ar->wmi.pdev_param->rx_chain_mask, rx_ant) funcion in used in
> __ath10k_set_antenna.

Newer kernels should have this support, and it seemed to work in my
testing.  I did not test power consumption.

What kernel version are you using?

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
