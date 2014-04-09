Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WXqQJ-0006QO-4c
 for ath10k@lists.infradead.org; Wed, 09 Apr 2014 11:12:09 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: For Help: problems with tx bitrate in ath10k
References: <5343B89E.2090407@dhc.com.cn>
 <CAEFj984QK4+-P39YUEvZekNk-TViYwDTR1QweZvWUkHF2wtoCw@mail.gmail.com>
Date: Wed, 9 Apr 2014 14:11:30 +0300
In-Reply-To: <CAEFj984QK4+-P39YUEvZekNk-TViYwDTR1QweZvWUkHF2wtoCw@mail.gmail.com>
 (Yeoh Chun-Yeow's message of "Wed, 9 Apr 2014 11:11:32 +0800")
Message-ID: <878urekba5.fsf@kamboji.qca.qualcomm.com>
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
To: Yeoh Chun-Yeow <yeohchunyeow@gmail.com>
Cc: wangdc <wangdc@dhc.com.cn>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Yeoh Chun-Yeow <yeohchunyeow@gmail.com> writes:

> Need firmware change to get proper Tx rate as pointed out by Kalle
> Valo. So no support for the time being.
>
> http://lists.infradead.org/pipermail/ath10k/2014-March/001587.html

That's right. I added this question also to the FAQ:

http://wireless.kernel.org/en/users/Drivers/ath10k/faq#Why_the_TX_rate_reported_to_user_space_is_wrong.3F

Is there any way to report to user space that TX rate reports are not
supported? If not, it would be great if someone would have time to add
that to cfg80211/mac80211. This issue is confusing a lot of people.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
