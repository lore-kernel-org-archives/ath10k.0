Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ve0-x22e.google.com ([2607:f8b0:400c:c01::22e])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WR0Re-0007Ve-Qt
 for ath10k@lists.infradead.org; Fri, 21 Mar 2014 14:29:15 +0000
Received: by mail-ve0-f174.google.com with SMTP id oz11so2571249veb.5
 for <ath10k@lists.infradead.org>; Fri, 21 Mar 2014 07:28:52 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CA+BoTQ=X=UxikrVrmr3hyQgjN2Tg5aeW5Ok7b+23n9X6bxRshA@mail.gmail.com>
References: <1395396014-24631-1-git-send-email-yeohchunyeow@gmail.com>
 <CA+BoTQ=X=UxikrVrmr3hyQgjN2Tg5aeW5Ok7b+23n9X6bxRshA@mail.gmail.com>
Date: Fri, 21 Mar 2014 22:22:59 +0800
Message-ID: <CAEFj987cTdr_7bhMajp2fRK5y1WAy0icyUJcTWSahW5sGFAFWQ@mail.gmail.com>
Subject: Re: [PATCH] ath10k: add the Rx rate in FW stats
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

> Unfortunately this isn't as simple as it seems.
>
> Stats are received via wmi_stats_event. This structure contains fields
> describing number of pdev/vdev/beer/bcn stat entries. All entries
> (structures) are appended in certain order after this header. This
> means if you change length of structure type you skew the calculation
> of all succeeding entries.
>
> IOW this means this patch breaks peer stats for 999.999.0.636.
>
> I'm quite positive wmi_pdev_stats is also broken. This implies vdev
> stats and peer stats position calculation is skewed in the first place
> and you get garbage.
>
> The main problem here is there are subtle yet crazy binary
> incompatibilities between these firmwares.
>
> The best way would probably be to implement wmi as an abstraction
> layer with completely different backends for different firmware
> branches/revisions. Otherwise you sign up for some pain..

Thanks for your explanation. I will definitely take a look on this if
I am able to figure out.

This patch seems work well with patch from Ben Greear on latest AP firmware.

----
Chun-Yeow

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
