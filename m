Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-yk0-x230.google.com ([2607:f8b0:4002:c07::230])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WdFf9-0006ie-LV
 for ath10k@lists.infradead.org; Thu, 24 Apr 2014 09:09:48 +0000
Received: by mail-yk0-f176.google.com with SMTP id 19so1802604ykq.21
 for <ath10k@lists.infradead.org>; Thu, 24 Apr 2014 02:09:26 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CA+BoTQ=uvkjK-BYJL3gympEiraZupLdh67XzMjuGviQ4iaVuiw@mail.gmail.com>
References: <1398327250-12923-1-git-send-email-yeohchunyeow@gmail.com>
 <CA+BoTQkBCGyKYDaOMgdCi4Yw+SXeuRS+t0rGE8o=8+x2q5N74w@mail.gmail.com>
 <CAEFj986fsmUD2kvEN=vjHK32cunyFO+8bH-y7ZoWZAMkcunJ2w@mail.gmail.com>
 <CA+BoTQ=uvkjK-BYJL3gympEiraZupLdh67XzMjuGviQ4iaVuiw@mail.gmail.com>
Date: Thu, 24 Apr 2014 17:09:25 +0800
Message-ID: <CAEFj987CE+RLxLXFhKyvKEWB6PK-Dd7Rnq98th+w1hBJoy48Pg@mail.gmail.com>
Subject: Re: [PATCH] ath10k: don't allow stand alone monitor mode for non-AP
 firmware
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
To: Michal Kazior <michal.kazior@tieto.com>
Cc: Kalle Valo <kvalo@qca.qualcomm.com>, linux-wireless <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On Thu, Apr 24, 2014 at 4:53 PM, Michal Kazior <michal.kazior@tieto.com> wrote:
> On 24 April 2014 10:50, Yeoh Chun-Yeow <yeohchunyeow@gmail.com> wrote:
>>> I think Monitor operation should be performed on a best effort basis.
>>> This means monitor_start/stop should be attempted once number of
>>> non-monitor vdevs changes.
>>
>> I am too clear about this. Do you mean that actually we can have
>> monitor mode on non-monitor vdevs in firmware 636?
>
> No. What I mean is we should attempt to start monitor vdev once at
> least 1 non-monitor vdev is present and stop monitor vdev is last
> non-monitor vdev is about to be stopped on 636.
>

Got it. But my investigation on firmware 636 shows that the firmware
crashes even though 1 non-monitor vdev is present. So can we conclude
actually monitor mode is not allowed in firmware 636.

---
Chun-Yeow

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
