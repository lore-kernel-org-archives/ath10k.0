Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by merlin.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bAGmo-0000aB-Ks
 for ath10k@lists.infradead.org; Tue, 07 Jun 2016 13:11:15 +0000
Message-ID: <5756C4BC.3040402@candelatech.com>
Date: Tue, 07 Jun 2016 05:57:32 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: Question on "ath10k: document ofdm/5ghz rate offset with a macro"
References: <5755EA60.7070504@candelatech.com>
 <CA+BoTQ=sGYcoHcBcPKqzqqFekbV9g23ZZ556N9+9kmtZKV=kEg@mail.gmail.com>
In-Reply-To: <CA+BoTQ=sGYcoHcBcPKqzqqFekbV9g23ZZ556N9+9kmtZKV=kEg@mail.gmail.com>
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
Cc: ath10k <ath10k@lists.infradead.org>



On 06/06/2016 11:23 PM, Michal Kazior wrote:
> On 6 June 2016 at 23:25, Ben Greear <greearb@candelatech.com> wrote:
>> While porting some patches forward, I notice the change below
>> that renamed the method to "ath10k_mac_sta_has_ofdm_only".  But,
>> that is not really what that is checking, since it just throws
>> away the CCK rates (and they might have been there).
>>
>> Maybe it should just be "ath10k_mac_sta_has_ofdm()" ?
>
> Yes, this seems like an unfortunate name pick on my side. The MODE_11G
> phymode is for mixed b/g.

I think the actual code behaviour is right.  I have some patches to
support G-only mode and such, and will change the name of your method
in those patches to be more clear.

Lots of other pending patches of mine before I will get to trying to push
that one upstream though.

Thanks,
Ben


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
