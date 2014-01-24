Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.candelatech.com ([208.74.158.172] helo=ns3.lanforge.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W6mBK-0004gm-Eu
 for ath10k@lists.infradead.org; Fri, 24 Jan 2014 19:12:47 +0000
Message-ID: <52E2BB17.1010309@candelatech.com>
Date: Fri, 24 Jan 2014 11:12:23 -0800
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: Anyone done long term testing?
References: <52E29ABF.9040403@candelatech.com>
 <87eh3x2oec.fsf@kamboji.qca.qualcomm.com>
In-Reply-To: <87eh3x2oec.fsf@kamboji.qca.qualcomm.com>
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
To: Kalle Valo <kvalo@qca.qualcomm.com>
Cc: ath10k@lists.infradead.org

On 01/24/2014 11:03 AM, Kalle Valo wrote:
> Ben Greear <greearb@candelatech.com> writes:
> 
>> I left an ath10k system up overnight, running 128kbps traffic on each
>> of 32 stations, and by morning, the machine was OOM.
> 
> Did you see SWBA overrun warnings before the OOM? I saw one report of
> such issue. This patch should help with that:
> 
> 748afc4 ath10k: implement and use new beacon method
> 
>> Just curious if anyone had done overnight traffic runs with any luck?
> 
> I'm running our AP135 board with ath9k+ath10k as my main AP and have
> seen SWBA overruns few times, otherwise it has been pretty stable. But I
> haven't yet tested with the patch above to see if the SWBA overruns are
> really gone.

I didn't notice any SWBA warnings, but perhaps they were there.
I'll keep a look out for them if it happens again.

I'm also running in station mode, with lots of station vifs, so might be
hitting some issue specific to that.  I guess in station mode I shouldn't
be sending any beacons anyway, so probably not the beacon issue.

I'll update to latest to pull in that beacon patch and continue testing.

Thanks,
Ben


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
