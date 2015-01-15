Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-we0-x22b.google.com ([2a00:1450:400c:c03::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YBtSB-0008BA-Lh
 for ath10k@lists.infradead.org; Thu, 15 Jan 2015 23:03:52 +0000
Received: by mail-we0-f171.google.com with SMTP id u56so17425854wes.2
 for <ath10k@lists.infradead.org>; Thu, 15 Jan 2015 15:03:29 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <21687.32167.596541.729136@gargle.gargle.HOWL>
References: <1420432796-10765-1-git-send-email-sujith@msujith.org>
 <87r3uy4t9y.fsf@kamboji.qca.qualcomm.com>
 <21685.35179.110539.780864@gargle.gargle.HOWL>
 <87bnm01ojf.fsf@kamboji.qca.qualcomm.com>
 <21687.29026.962216.812998@gargle.gargle.HOWL>
 <87vbk8zcr1.fsf@kamboji.qca.qualcomm.com>
 <21687.30578.746681.850817@gargle.gargle.HOWL>
 <87mw5kzbog.fsf@kamboji.qca.qualcomm.com>
 <21687.32167.596541.729136@gargle.gargle.HOWL>
From: Julian Calaby <julian.calaby@gmail.com>
Date: Fri, 16 Jan 2015 10:03:08 +1100
Message-ID: <CAGRGNgUB3K6KG1Stst9vwQsGQ03DXGBx_fs6NZ+KEGA1HS2npA@mail.gmail.com>
Subject: Re: [PATCH] ath10k: Make HTT fill size configurable
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
To: Sujith Manoharan <sujith@msujith.org>
Cc: Kalle Valo <kvalo@qca.qualcomm.com>, linux-wireless <linux-wireless@vger.kernel.org>, ath10k@lists.infradead.org

Hi Sujith,

On Thu, Jan 15, 2015 at 7:43 PM, Sujith Manoharan <sujith@msujith.org> wrote:
> Kalle Valo wrote:
>> Yeah, but everyone want higher throughput (including me). So what value
>> is best in your opinion?
>
> Lower throughput has been okay for all this time, with a value
> of 16. I suppose the value can be retained to not cause regressions
> on AP135 or other platforms with a low-powered CPU. As Michal mentioned,
> this value allows AP135 to function without the watchdog rebooting
> the board.

Can we detect if this parameter is too high / low and adjust / limit
it on the fly?

Thanks,

-- 
Julian Calaby

Email: julian.calaby@gmail.com
Profile: http://www.google.com/profiles/julian.calaby/

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
