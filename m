Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.w1.fi ([212.71.239.96] helo=li674-96.members.linode.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WSSZU-00078u-2V
 for ath10k@lists.infradead.org; Tue, 25 Mar 2014 14:43:20 +0000
Date: Tue, 25 Mar 2014 16:42:55 +0200
From: Jouni Malinen <j@w1.fi>
Subject: Re: Scanning all 5Ghz channels with AC NIC.
Message-ID: <20140325144255.GA30784@w1.fi>
References: <53307524.8070501@candelatech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <53307524.8070501@candelatech.com>
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
Cc: "hostap@lists.shmoo.com" <hostap@lists.shmoo.com>, ath10k <ath10k@lists.infradead.org>

On Mon, Mar 24, 2014 at 11:10:44AM -0700, Ben Greear wrote:
> I notice this issue while trying to scan specific channels with
> an ath10k NIC.
> 
> If I configure supplicant to use a specific freq list, it will fail:
> 
> 1395683887.458813: nl80211: Scan frequency 5170 MHz
> 1395683887.458823: nl80211: Scan frequency 5180 MHz
...

You need to be quite careful when using freq_list. wpa_supplicant will
use exactly what is provided there and if cfg80211 does not like what it
sees, it will reject this. Apparently duplicate entries would hit that
and so would channels that the driver does not support.

In general, it is much easier to just do "wpa_cli scan freq=4900-6000"
if you just want to scan all the enabled 5 GHz channels.

-- 
Jouni Malinen                                            PGP id EFC895FA

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
