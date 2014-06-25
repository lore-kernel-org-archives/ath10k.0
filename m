Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WzmUp-0006tV-NS
 for ath10k@lists.infradead.org; Wed, 25 Jun 2014 12:40:16 +0000
Message-ID: <53AAC317.4050403@candelatech.com>
Date: Wed, 25 Jun 2014 05:39:51 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: CT and AP firmware not allowed beaconing in adhoc mode
References: <CAEFj987hAnJV_0KOk4qfk3YbzPZNWqVY1Uq2sDe-+F0bw3hgbA@mail.gmail.com>
 <CA+BoTQnnrjhUK_ZPwpG-L+wQ=suisNrkb1Tdhdww4ueMpAvDwQ@mail.gmail.com>
In-Reply-To: <CA+BoTQnnrjhUK_ZPwpG-L+wQ=suisNrkb1Tdhdww4ueMpAvDwQ@mail.gmail.com>
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
To: Michal Kazior <michal.kazior@tieto.com>, Yeoh Chun-Yeow <yeohchunyeow@gmail.com>
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>



On 06/25/2014 05:33 AM, Michal Kazior wrote:
> On 25 June 2014 06:50, Yeoh Chun-Yeow <yeohchunyeow@gmail.com> wrote:
>> Hi, all
>>
>> Both CT and AP firmware seem not allow beaconing in adhoc  mode.
>> Anyone will fix this?
>
> AP firmware doesn't really support IBSS. I guess ath10k shouldn't
> advertise the iftype if 10.1 firmware is used.
>
> As far as I know CT firmware is based on the AP firmware branch which
> means no IBSS as well.

That is true.  I have not had any time to see what it would take
to support IBSS in the 10.1.x firmware, and do not have access to the
999.x source to see what it does differently.

I'm not sure when I'll have time to work on it....

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
