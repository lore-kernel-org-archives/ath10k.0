Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Wsa4b-0001Yb-6J
 for ath10k@lists.infradead.org; Thu, 05 Jun 2014 15:59:25 +0000
Message-ID: <539093C8.2060908@candelatech.com>
Date: Thu, 05 Jun 2014 08:59:04 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: Firmware debugging patches?
References: <53891ACD.7070902@candelatech.com>
 <87wqczz3h9.fsf@kamboji.qca.qualcomm.com> <538CA904.4000508@candelatech.com>
 <87ioojz1b1.fsf@kamboji.qca.qualcomm.com> <538CB782.1000509@candelatech.com>
 <538CC68C.10808@gmail.com> <538CC949.5020901@candelatech.com>
 <87fvjjpqqe.fsf@kamboji.qca.qualcomm.com>
In-Reply-To: <87fvjjpqqe.fsf@kamboji.qca.qualcomm.com>
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
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, ath10k <ath10k@lists.infradead.org>, Emmanuel Grumbach <egrumbach@gmail.com>

On 06/05/2014 03:58 AM, Kalle Valo wrote:
> Ben Greear <greearb@candelatech.com> writes:
> 
>> I am not sure this is really the case currently.  But, once the
>> blob is generated and stored in RAM, it would be easily enough to
>> add ethtool option to dump it w/out debugfs support.  This will
>> still not really address my concerns because it may take a year
>> or two for the latest ethtool binary to make it to normal-ish users.
> 
> [...]
> 
>> I think ethtool would not be overly hard to implement...basic framework is already
>> in the wifi stack.
> 
> Few weeks back John Linville sent ethtool related patches to support
> something like this. Did you notice that?


I didn't...but will take a look once I get my pending patches
dealt with.

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
