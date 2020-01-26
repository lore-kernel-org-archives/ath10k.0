Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail26.static.mailgun.info ([104.130.122.26])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iviqg-000825-Vy
 for ath10k@lists.infradead.org; Sun, 26 Jan 2020 14:25:16 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH] ath10k: Use device_get_match_data() to simplify code
References: <20200123232944.39247-1-swboyd@chromium.org>
 <CAMrEMU-e55q7uvd220+1kuYJ4Xa-4ckz5CvYezCj2ahn_K8t9w@mail.gmail.com>
Date: Sun, 26 Jan 2020 16:25:07 +0200
In-Reply-To: <CAMrEMU-e55q7uvd220+1kuYJ4Xa-4ckz5CvYezCj2ahn_K8t9w@mail.gmail.com>
 (Justin Capella's message of "Sat, 25 Jan 2020 20:18:40 -0800")
Message-ID: <87o8uqcn24.fsf@kamboji.qca.qualcomm.com>
MIME-Version: 1.0
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
To: Justin Capella <justincapella@gmail.com>
Cc: netdev@vger.kernel.org, linux-wireless <linux-wireless@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, ath10k <ath10k@lists.infradead.org>, Stephen Boyd <swboyd@chromium.org>

Justin Capella <justincapella@gmail.com> writes:

> Maybe use dev here as well?
>
>>                 dev_err(&pdev->dev, "failed to find matching device tree id\n");

I changed that. And also fixed a checkpatch warning:

drivers/net/wireless/ath/ath10k/snoc.c:1483: Please don't use multiple blank lines

-- 
https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
