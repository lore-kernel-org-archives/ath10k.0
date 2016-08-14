Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by merlin.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bYwgO-0003Uc-Bu
 for ath10k@lists.infradead.org; Sun, 14 Aug 2016 14:46:36 +0000
Message-ID: <57B0841F.4050008@candelatech.com>
Date: Sun, 14 Aug 2016 07:45:51 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: ath10k: Are there any PCI based WLAN cards to be plugged into
 desktop PC?
References: <57B068DA.1080804@gmail.com>
In-Reply-To: <57B068DA.1080804@gmail.com>
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
To: Xuebing Wang <xbing6@gmail.com>, ath10k@lists.infradead.org

You can get pcie <-> mini-pcie adapters easily enough, and then put one of the standard
mini-pcie NICs in it.  We use WLE900VX successfully like this.

Thanks,
Ben

On 08/14/2016 05:49 AM, Xuebing Wang wrote:
> Hi Community,
>
> I'd like to study ath10k driver and buy an ath10k WLAN card to plug into my Ubuntu PC. I googled and checked ath10k wiki, it seems most ath10k cards are PCIe based modules or to be used in APs. Are there any ath10k WLAN cards to be plugged into desktop PC?
>
> Also, I googled and can not find ath10k datasheet (e.g. qca9880 or qca6174 with any firmware versions), any suggestions on the specifications or datasheets?
>
> Thanks.
>

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
