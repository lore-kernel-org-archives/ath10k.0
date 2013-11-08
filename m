Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] wcn36xx: Fix logging macro with unnecessary semicolon
References: <1383684000.4387.42.camel@joe-AO722>
 <CAFSJ42YQy96Sko8CuG9BGjHzTV7TkRp2=NVt036APxSKpPB=Ag@mail.gmail.com>
 <1383760556.7940.28.camel@joe-AO722>
 <CAFSJ42Y-3BZqj+JRNa8wdxjnm1fguD8ToH5Oj0m56yT5NexdVQ@mail.gmail.com>
 <1383853221.9263.14.camel@joe-AO722>
Date: Fri, 8 Nov 2013 09:06:19 +0200
In-Reply-To: <1383853221.9263.14.camel@joe-AO722> (Joe Perches's message of
 "Thu, 7 Nov 2013 11:40:21 -0800")
Message-ID: <87bo1vcqz8.fsf@kamboji.qca.qualcomm.com>
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
To: Joe Perches <joe@perches.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, wil6210@qca.qualcomm.com, netdev@vger.kernel.org, ath5k-devel@lists.ath5k.org, linux-wireless <linux-wireless@vger.kernel.org>, "John W. Linville" <linville@tuxdriver.com>, ath10k@lists.infradead.org, "Luis R. Rodriguez" <rodrigue@qca.qualcomm.com>, ath9k-devel <ath9k-devel@lists.ath9k.org>, wcn36xx <wcn36xx@lists.infradead.org>, Eugene Krasnikov <k.eugene.e@gmail.com>

Joe Perches <joe@perches.com> writes:

>> have a
>> second round of convincing ath guys to change printing code. How does
>> that sound?
>
> Luis?  Kalle?  Other Qualcomm/Atheros folk?

I didn't quite get what you are asking from me. But for me most
important is that the current debugging facilities from user's point of
view don't change. I don't care if the code is in ath10k.ko or ath.ko,
we are talking about ~100 lines of code anyway.

> One of the nominal benefits of separating the ath_<level>
> macros by subsystem was perf/tracing.

Nominal?

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
