Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-la0-x236.google.com ([2a00:1450:4010:c03::236])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X9s16-0000QG-5f
 for ath10k@lists.infradead.org; Wed, 23 Jul 2014 08:35:16 +0000
Received: by mail-la0-f54.google.com with SMTP id el20so659525lab.13
 for <ath10k@lists.infradead.org>; Wed, 23 Jul 2014 01:34:52 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CA+BoTQnngYO_AzqQnxFpWQrez-q7Z=hBUNOt+H8FybE9+fq5fA@mail.gmail.com>
References: <1406070154-6614-1-git-send-email-greearb@candelatech.com>
 <CA+BoTQnngYO_AzqQnxFpWQrez-q7Z=hBUNOt+H8FybE9+fq5fA@mail.gmail.com>
Date: Wed, 23 Jul 2014 11:34:52 +0300
Message-ID: <CANUX_P3BaQU6Xx+U2Ujwin6JSvsnf-jdB3Hi7vA1sXJDrvmm-Q@mail.gmail.com>
Subject: Re: [PATCH v3 1/5] ath10k: provide firmware crash info via debugfs.
From: Emmanuel Grumbach <egrumbach@gmail.com>
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
To: Michal Kazior <michal.kazior@tieto.com>
Cc: Ben Greear <greearb@candelatech.com>, linux-wireless <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On Wed, Jul 23, 2014 at 11:25 AM, Michal Kazior <michal.kazior@tieto.com> wrote:
> On 23 July 2014 01:02,  <greearb@candelatech.com> wrote:
>> From: Ben Greear <greearb@candelatech.com>
>>
>> Store the firmware crash registers and last 128 or so
>> firmware debug-log ids and present them to user-space
>> via debugfs.
>>
>> Should help with figuring out why the firmware crashed.
>>

Do we plan to have a common place for all the drivers?
I'd suggest to have mac80211 / cfg80211 link to a file created by the
driver. This would allow us to have this file even if we haven't
registered to mac80211 yet - although it'd be under a different place.
What do you think?

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
