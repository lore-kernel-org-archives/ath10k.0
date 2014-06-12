Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.sablalik.us ([66.80.92.144])
 by bombadil.infradead.org with smtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WvA4V-0006Jb-84
 for ath10k@lists.infradead.org; Thu, 12 Jun 2014 18:50:03 +0000
Date: Thu, 12 Jun 2014 14:49:24 -0400
Subject: Re: basic help request
From: Peter Sabat <pete@sablalik.us>
Message-ID: <CFBF6DF3.B2656%pete@sablalik.us>
In-Reply-To: <53993583.2000607@candelatech.com>
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

I think I may have found a clue - just noticed on the console




root@server2:/run# [  856.450077] ath10k: target stalled
[  856.453659] ath10k: failed to wait for target to init: -5







On 6/12/14, 1:07 AM, "Ben Greear" <greearb@candelatech.com> wrote:

>
>
>On 06/11/2014 09:58 PM, Peter Sabat wrote:
>> So I grabbed it again - I just did a wget before, maybe something got
>> garbled there.
>
>It's using the new firmware, I don't think mod-info
>is entirely correct.
>
>Others have reported problems with upstream firmware and
>bridging, but not sure if that is your problem or not.
>
>You might try:  dmesg | grep "crash"
>to see if firmware is crashing.
>
>Or, remove the bridge logic from your hostapd config
>file.
>
>Or possibly, give my firmware a try:
>
>http://www.candelatech.com/ath10k.php
>
>I haven't done any testing with ath10k APs in
>a bridge yet, so no idea how well or not it actually
>works.
>
>Thanks,
>Ben
>
>-- 
>Ben Greear <greearb@candelatech.com>
>Candela Technologies Inc  http://www.candelatech.com
>
>_______________________________________________
>ath10k mailing list
>ath10k@lists.infradead.org
>http://lists.infradead.org/mailman/listinfo/ath10k




_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
