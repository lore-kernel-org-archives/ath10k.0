Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wm0-x22d.google.com ([2a00:1450:400c:c09::22d])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1clI17-0007KR-Fe
 for ath10k@lists.infradead.org; Tue, 07 Mar 2017 16:31:19 +0000
Received: by mail-wm0-x22d.google.com with SMTP id n11so9602934wma.0
 for <ath10k@lists.infradead.org>; Tue, 07 Mar 2017 08:30:56 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <30387745.tG59X1cezt@bentobox>
References: <1591748.RGYhBEn8I1@bentobox>
 <CAJ-Vmom3g+cbNG7hXjUB=Rnh9S_rHmr7hS2Z6H+m=LQCfezBAg@mail.gmail.com>
 <30387745.tG59X1cezt@bentobox>
From: Adrian Chadd <adrian@freebsd.org>
Date: Tue, 7 Mar 2017 08:30:54 -0800
Message-ID: <CAJ-Vmom6_-PAnwSjuA5t3a1AKrLhi58ufkLYAjJZkkD5nneusQ@mail.gmail.com>
Subject: Re: QCA4019: calibration files and board files
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
To: Sven Eckelmann <sven.eckelmann@openmesh.com>
Cc: Christian Lamparter <chunkeey@googlemail.com>, simon.wunderlich@openmesh.com, Michal Kazior <michal.kazior@tieto.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

"use your own bmi ids". :-)

(yeah, this is going to make open source firmware for these things
more painful than it should be. :( )



-adrian


On 7 March 2017 at 01:54, Sven Eckelmann <sven.eckelmann@openmesh.com> wrote:
> Hi Adrian,
>
> On Montag, 30. Januar 2017 08:36:19 CET Adrian Chadd wrote:
>> If people aren't using unique BMI IDs (which is another question we
>> have for QCA) then it's possible you don't have enough information to
>> "know" which board data to use, so it has to be overridden by a custom
>> package. We do this at work for our own boards as well - they're
>> sufficiently different to a reference board that indeed we need to
>> "know".
>
> Did you get any feedback from QCA? Our requests regarding registration of two
> own bmi-board-ids for our product were always answered (slightly simplified)
> with "don't change the BDF files", "always use board-2.bin from driver/
> firmware" and "ask your ODM". This basically didn't help us and didn't answer
> the question and creates quite a big problem for us because the ODM insists
> that we should use his BDF [1] files with modifications [tm]. We just found
> out that the ODM used a modified version of the DK04.1 BDF files but used the
> bmi-board-id's for the AP-DK01.1-C1 - so we still have a long road ahead.
>
> We are still trying to get more information. But I though that I could ask you
> in the meantime whether you had more success and have a status update.
>
> Kind regards,
>         Sven
>
> [1] According to QCA, the BDF files are just the single board files inside
>     the board-2.bin

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
