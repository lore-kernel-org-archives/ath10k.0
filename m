Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ve0-x22b.google.com ([2607:f8b0:400c:c01::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X04JA-0001HM-BF
 for ath10k@lists.infradead.org; Thu, 26 Jun 2014 07:41:25 +0000
Received: by mail-ve0-f171.google.com with SMTP id jz11so3250616veb.16
 for <ath10k@lists.infradead.org>; Thu, 26 Jun 2014 00:40:59 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <53AAC317.4050403@candelatech.com>
References: <CAEFj987hAnJV_0KOk4qfk3YbzPZNWqVY1Uq2sDe-+F0bw3hgbA@mail.gmail.com>
 <CA+BoTQnnrjhUK_ZPwpG-L+wQ=suisNrkb1Tdhdww4ueMpAvDwQ@mail.gmail.com>
 <53AAC317.4050403@candelatech.com>
Date: Thu, 26 Jun 2014 15:40:59 +0800
Message-ID: <CAEFj9861McWmx4s81Y6bDirJX4s99_WG4W6Voi2fZRreoeB=4w@mail.gmail.com>
Subject: Re: CT and AP firmware not allowed beaconing in adhoc mode
From: Yeoh Chun-Yeow <yeohchunyeow@gmail.com>
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
Cc: Michal Kazior <michal.kazior@tieto.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Not possible for all the modes to be supported in one single firmware?

----
Chun-Yeow

On Wed, Jun 25, 2014 at 8:39 PM, Ben Greear <greearb@candelatech.com> wrote:
>
>
> On 06/25/2014 05:33 AM, Michal Kazior wrote:
>>
>> On 25 June 2014 06:50, Yeoh Chun-Yeow <yeohchunyeow@gmail.com> wrote:
>>>
>>> Hi, all
>>>
>>> Both CT and AP firmware seem not allow beaconing in adhoc  mode.
>>> Anyone will fix this?
>>
>>
>> AP firmware doesn't really support IBSS. I guess ath10k shouldn't
>> advertise the iftype if 10.1 firmware is used.
>>
>> As far as I know CT firmware is based on the AP firmware branch which
>> means no IBSS as well.
>
>
> That is true.  I have not had any time to see what it would take
> to support IBSS in the 10.1.x firmware, and do not have access to the
> 999.x source to see what it does differently.
>
> I'm not sure when I'll have time to work on it....
>
> Thanks,
> Ben
>
> --
> Ben Greear <greearb@candelatech.com>
> Candela Technologies Inc  http://www.candelatech.com

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
