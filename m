Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.candelatech.com ([208.74.158.172] helo=ns3.lanforge.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WWy0N-0001m3-1t
 for ath10k@lists.infradead.org; Mon, 07 Apr 2014 01:05:43 +0000
Message-ID: <5341F9D0.2090808@candelatech.com>
Date: Sun, 06 Apr 2014 18:05:20 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: [RFT 0/4] ath10k: fix flushing and tx stalls
References: <1396611464-5940-1-git-send-email-michal.kazior@tieto.com>
 <5341F1A9.2030202@candelatech.com>
In-Reply-To: <5341F1A9.2030202@candelatech.com>
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
To: Michal Kazior <michal.kazior@tieto.com>, ath10k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org

On 04/06/2014 05:30 PM, Ben Greear wrote:
> On 04/04/2014 04:37 AM, Michal Kazior wrote:
>> Hi,
>>
>> After digging around I've found what seems to be
>> the problem with WMI Tx credit starvation and
>> inability to properly flush Tx in ath10k_flush().
>
> I applied all four, rebooted AP and Station machine with the
> new kernel (3.14.0-wl-ath+).  I had removed my own tx-hang detection
> hack.

Looks like the problems start with patch 3/4.

All tests were done with all 4 patches applied on the AP machine,
and it appears that works fine.  The station machine worked fine with
the first two patches, but when third was applied, only a few stations
come up and I get behaviour similar to that described in the first email,
but I do not see anything obviously wrong in dmesg...

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
