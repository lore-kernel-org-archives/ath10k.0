Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by merlin.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bfxXT-0007Qo-Jg
 for ath10k@lists.infradead.org; Fri, 02 Sep 2016 23:06:24 +0000
Subject: Re: Throughput weirdness on 9984
References: <CAAnMG+NUtOyxrzyXc4TyzPR8nuz2RcG80+GBwEZdfBFDknL2eQ@mail.gmail.com>
 <35fa0be2-6ac6-0f7f-cb4e-e8bfced4199c@candelatech.com>
 <CAAnMG+ORJDToFPnn0hB4h33F4zKbmT7QyNKDM26Jao_sT24APA@mail.gmail.com>
From: Ben Greear <greearb@candelatech.com>
Message-ID: <ae4d1a0d-1e41-df60-48c9-1cd66430c1d0@candelatech.com>
Date: Fri, 2 Sep 2016 15:52:46 -0700
MIME-Version: 1.0
In-Reply-To: <CAAnMG+ORJDToFPnn0hB4h33F4zKbmT7QyNKDM26Jao_sT24APA@mail.gmail.com>
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
To: Alexis Green <agreen@cococorp.com>
Cc: ath10k@lists.infradead.org

On 09/02/2016 03:14 PM, Alexis Green wrote:
> I just ran run AP + STA mode and it appears to behave the same way.
> Also, as far as reported rates, it appears that the rates are similar.

I just ran a quick test with 9984 as STA and a 9880 3x3 AP, over-the-air, UDP

Download about 550Mbps, Upload about 350Mbps.

I'm using a different compile than what is in LEDE, will send it to you
directly.

Could also be that for whatever reason connecting to a non 9984 AP 'fixes' things.

I don't have two functional 9984 systems to test against at this point, but should
have something soon.

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
