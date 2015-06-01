Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YzJut-0004a9-Hu
 for ath10k@lists.infradead.org; Mon, 01 Jun 2015 07:13:48 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: system hang with backports-20150511/20150525
References: <CAOiWkA_i8mSx_DtW-Z8mdSiqMZcUXJp0nwCrZGkEZDWBUb3cVg@mail.gmail.com>
 <CA+BoTQnfXGLSvbx+hLfi_2w90-LgC3Uba0ZcO+Pt7J3FcEE9wg@mail.gmail.com>
Date: Mon, 1 Jun 2015 10:13:20 +0300
In-Reply-To: <CA+BoTQnfXGLSvbx+hLfi_2w90-LgC3Uba0ZcO+Pt7J3FcEE9wg@mail.gmail.com>
 (Michal Kazior's message of "Mon, 1 Jun 2015 08:36:06 +0200")
Message-ID: <87vbf7vr3j.fsf@kamboji.qca.qualcomm.com>
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
To: Michal Kazior <michal.kazior@tieto.com>
Cc: Martin Faltesek <martin.faltesek@gmail.com>, linux-wireless <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, Marty Faltesek <mfaltesek@google.com>

Michal Kazior <michal.kazior@tieto.com> writes:

> +ath10k list
>
> On 1 June 2015 at 03:37, Marty Faltesek <mfaltesek@google.com> wrote:
>> Starting with backports-20150511, and continuing with
>> backports-20150525, we see frequent system hangs. backports-20150424
>> had no issue.
>
> I don't see such binary releases on
> https://backports.wiki.kernel.org/index.php/Main_Page
> Hence I don't know what kernel you've backported the drivers from and
> I can't compare anything.
>
> Can you provide more details, please?

I suspect it's from here:

https://www.kernel.org/pub/linux/kernel/projects/backports/2015/05/25/

The backports project pages are a bit confusing and that location is
hard to find.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
