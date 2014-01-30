Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-bk0-x22a.google.com ([2a00:1450:4008:c01::22a])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W8tkn-0002rM-2m
 for ath10k@lists.infradead.org; Thu, 30 Jan 2014 15:42:10 +0000
Received: by mail-bk0-f42.google.com with SMTP id 6so1515494bkj.29
 for <ath10k@lists.infradead.org>; Thu, 30 Jan 2014 07:41:47 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <8761p221lu.fsf@kamboji.qca.qualcomm.com>
References: <CAEFj985_s1Q=S-9EVLySzXkCorQkLn6jNBcVCeDUBqWzCw+A6Q@mail.gmail.com>
 <8761p221lu.fsf@kamboji.qca.qualcomm.com>
Date: Thu, 30 Jan 2014 23:41:46 +0800
Message-ID: <CAEFj985utGukLe2J+WXRTz+DDu7o3urUENCMJE--BXv8HjvhFg@mail.gmail.com>
Subject: Re: fw_stats available in 10.x FW
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
To: Kalle Valo <kvalo@qca.qualcomm.com>
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Try to apply the patches mentioned here for 10.x FW, but did not work as well.
http://lists.infradead.org/pipermail/ath10k/2013-September/000317.html

The debug always complaints "ath10k: device successfully recovered" in
AP mode.... STA is not able to associate with the AP.

The FW tested is version 1.0.0.716, is this going to be available?

----
Chun-Yeow

On Thu, Jan 30, 2014 at 12:29 AM, Kalle Valo <kvalo@qca.qualcomm.com> wrote:
> Yeoh Chun-Yeow <yeohchunyeow@gmail.com> writes:
>
>> Try to retrieve the fw_stats on 10.x FW but no information.
>>
>> Is this supported by the firmware?
>
> Yes, but IIRC you need Bartosz' patches which are not applied yet:
>
> http://lists.infradead.org/pipermail/ath10k/2013-September/000317.html
>
> --
> Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
