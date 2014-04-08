Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wi0-f178.google.com ([209.85.212.178])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WXgLh-0004Ov-7s
 for ath10k@lists.infradead.org; Wed, 09 Apr 2014 00:26:42 +0000
Received: by mail-wi0-f178.google.com with SMTP id bs8so2324920wib.17
 for <ath10k@lists.infradead.org>; Tue, 08 Apr 2014 17:26:11 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <8761mkmfny.fsf@kamboji.qca.qualcomm.com>
References: <8761mkmfny.fsf@kamboji.qca.qualcomm.com>
From: Avery Pennarun <apenwarr@gmail.com>
Date: Tue, 8 Apr 2014 19:56:36 -0400
Message-ID: <CAHqTa-1DMgZBW9aqHEXjEy=PWytk88S-kiy3kOqtiGDWLi==cA@mail.gmail.com>
Subject: Re: ath10k FAQ
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
Cc: ath10k <ath10k@lists.infradead.org>

On Tue, Apr 8, 2014 at 3:41 AM, Kalle Valo <kvalo@qca.qualcomm.com> wrote:
> I created a small FAQ to the wiki and added the four questions which
> seem to be popular:
>
> http://wireless.kernel.org/en/users/Drivers/ath10k/faq
>
> Comments welcome. And feel free to update it with new questions.

This seems helpful.  For the first question ("can't set channel") I
think the provided answer is not the only cause of the problem, and
was not the one that confused me at first.  For me, the main confusion
was that it's pretty non-intuitive how to set the 80 MHz center
frequency in hostapd.conf ("the center frequency of the channel 6
higher than the lowest channel number in the 4-channel group").  It
might help if you could include an example for that.  I guess it
varies by country so it might be a little tricky.

Have fun,

Avery

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
