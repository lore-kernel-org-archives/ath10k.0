Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.candelatech.com ([208.74.158.172] helo=ns3.lanforge.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WSB7X-0002HU-WF
 for ath10k@lists.infradead.org; Mon, 24 Mar 2014 20:05:21 +0000
Message-ID: <53308FE9.6040307@candelatech.com>
Date: Mon, 24 Mar 2014 13:04:57 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: Scanning all 5Ghz channels with AC NIC.
References: <53307524.8070501@candelatech.com>
 <CALhHN=oNjWr+xP=5A_NEnUn1Hc-ht8N4LJ6CU836Q99LrdcAdA@mail.gmail.com>
 <53308BD4.8060605@candelatech.com>
In-Reply-To: <53308BD4.8060605@candelatech.com>
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
To: Janusz Dziedzic <janusz.dziedzic@tieto.com>
Cc: "hostap@lists.shmoo.com" <hostap@lists.shmoo.com>, ath10k <ath10k@lists.infradead.org>

On 03/24/2014 12:47 PM, Ben Greear wrote:

> Maybe my config is wrong...I was using freq_list instead of scan_freq,
> and using it twice...
> 
> ctrl_interface=/var/run/wpa_supplicant
> fast_reauth=1
> scan_cur_freq=1
> min_scan_gap=5
> freq_list=5170 5180 5190 5200 5210 5220 5230 5240 5260 5280 5300 5320 5500 5520 5540 5560 5580 5600 5580 5600 5620 5640 5660 5620 5640 5660 5680 5700 5745 5645
> 5785 5805 5825

Err, I simply had a duplicated channel (5580, 5600)...

Must have cut-n-pasted wrong.

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
