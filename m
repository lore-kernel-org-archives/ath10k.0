Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XNYtX-0003Iw-Cc
 for ath10k@lists.infradead.org; Sat, 30 Aug 2014 03:00:04 +0000
Message-ID: <54013E18.2060102@candelatech.com>
Date: Fri, 29 Aug 2014 19:59:36 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: [RFC] ath10k: use raw tx
References: <1408693965-29858-1-git-send-email-michal.kazior@tieto.com>
 <5400F497.7070904@candelatech.com>
In-Reply-To: <5400F497.7070904@candelatech.com>
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
To: Michal Kazior <michal.kazior@tieto.com>
Cc: ath10k@lists.infradead.org



On 08/29/2014 02:45 PM, Ben Greear wrote:
> On 08/22/2014 12:52 AM, Michal Kazior wrote:
>> This is just a reference for anyone interested in
>> getting injection working with ath10k.
>
> Did you try this with encryption?  I can reproduce the crash
> in open mode on my CT firmware, but I couldn't even get
> DHCP to complete with wpa2 enabled.

I found a null-deref in the firmware and fixed (ie, hacked around) it.

http://www.candelatech.com/downloads/firmware-2-full-community-raw-tx.bin

This seems to work fine for open encryption, at least.  I tested it with your
patch applied, on top of my other patches, on top of kvalo's latest ath tree.

I'd be curious to know if anyone else tries it.

Thanks,
Ben


>
> Thanks,
> Ben
>

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
