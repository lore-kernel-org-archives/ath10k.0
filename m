Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.sablalik.us ([66.80.92.144])
 by bombadil.infradead.org with smtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WvWN5-0001Zx-0c
 for ath10k@lists.infradead.org; Fri, 13 Jun 2014 18:38:39 +0000
Date: Fri, 13 Jun 2014 14:38:02 -0400
Subject: Re: basic help request
From: Peter Sabat <pete@sablalik.us>
Message-ID: <CFC0BC89.B2E43%pete@sablalik.us>
In-Reply-To: <539B3DF9.2040300@candelatech.com>
Mime-version: 1.0
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

I think that after your help w/ the FW copy (or whatever it was) this
turns out to be an example of no RTFM.

I was deceived since I could see scans from the STA, but it turns out that
this card needs a separate 5v input to actually work.  ;-)

The wife and I are using it right now.


Thanks again for all your assistance.

On 6/13/14, 2:07 PM, "Ben Greear" <greearb@candelatech.com> wrote:

>On 06/12/2014 11:49 AM, Peter Sabat wrote:
>> I think I may have found a clue - just noticed on the console
>> 
>> 
>> 
>> 
>> root@server2:/run# [  856.450077] ath10k: target stalled
>> [  856.453659] ath10k: failed to wait for target to init: -5
>
>I haven't tried your specific NIC, but the WLE900VX works well for me.
>
>Could try power-cycling..ath10k can get hung such that only a power-cycle
>fixes it sometimes.
>
>Thanks,
>Ben
>
>-- 
>Ben Greear <greearb@candelatech.com>
>Candela Technologies Inc  http://www.candelatech.com
>
>
>_______________________________________________
>ath10k mailing list
>ath10k@lists.infradead.org
>http://lists.infradead.org/mailman/listinfo/ath10k




_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
