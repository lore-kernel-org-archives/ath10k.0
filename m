Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZUDqS-0002rn-GG
 for ath10k@lists.infradead.org; Tue, 25 Aug 2015 13:01:00 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH/RFT 0/2] ath10k: add qca6164 support
References: <1439469147-9408-1-git-send-email-michal.kazior@tieto.com>
 <CAAay3RQ7N4CFpY3ffxc83Xh2rPDFxne9DZKi+Pay4-Z-+XQ5Bg@mail.gmail.com>
 <2368480.ClS0E9V45b@wuerfel>
Date: Tue, 25 Aug 2015 16:00:20 +0300
In-Reply-To: <2368480.ClS0E9V45b@wuerfel> (Arnd Bergmann's message of "Thu, 20
 Aug 2015 15:22:11 +0200")
Message-ID: <87a8tf5xqz.fsf@kamboji.qca.qualcomm.com>
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
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-wireless@vger.kernel.org, twilightrook@gmail.com, ath10k@lists.infradead.org, Oscar Rydberg <oscarrydberg@gmail.com>, Michal Kazior <michal.kazior@tieto.com>, joseph.salisbury@canonical.com, vvanpo@gmail.com

Arnd Bergmann <arnd@arndb.de> writes:

> On Tuesday 18 August 2015 11:52:45 Oscar Rydberg wrote:
>> I can confirm this patch did it for my Lenovo Yoga 3 14 with QCA6164, the
>> WLAN interface is now alive, up and running perfectly fine!
>> (After running modprobe -r ideapad-laptop that is, should anyone have
>> trouble enabling it)
>> 
>> I had tried all the board.bin files from the windows drivers before, so the
>> added sanity check seems to be what finally solved it.

Odd, I didn't see this mail from Oscar and almost missed it. Maybe the
mailing list blocked it?

Anyway, thanks for testing. I'll try to get patch 1 to Linux 4.3 so that
it would have proper qca6164 support. If there are issues still, we can
fix those in a followup patch.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
