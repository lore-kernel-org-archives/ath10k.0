Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VP4uK-0003FN-WF
 for ath10k@lists.infradead.org; Thu, 26 Sep 2013 06:18:37 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 3/3] ath10k: implement firmware IE container support
References: <20130925210455.2596.36889.stgit@localhost6.localdomain6>
 <20130925210848.2596.56332.stgit@localhost6.localdomain6>
 <CA+BoTQ=BhtjC1YNLs9OYBPN6TiYhyrwYoK2A1wifS01HVJp1YA@mail.gmail.com>
 <878uykunyc.fsf@kamboji.qca.qualcomm.com>
 <CA+BoTQ=v0snRLTP44LXVdQx2UVKYxLCW-JiWyMWOR4eEzMvFKA@mail.gmail.com>
Date: Thu, 26 Sep 2013 09:18:05 +0300
In-Reply-To: <CA+BoTQ=v0snRLTP44LXVdQx2UVKYxLCW-JiWyMWOR4eEzMvFKA@mail.gmail.com>
 (Michal Kazior's message of "Thu, 26 Sep 2013 08:04:39 +0200")
Message-ID: <87vc1ot8bm.fsf@kamboji.qca.qualcomm.com>
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
Cc: linux-wireless <linux-wireless@vger.kernel.org>, ath10k@lists.infradead.org

Michal Kazior <michal.kazior@tieto.com> writes:

> On 26 September 2013 07:55, Kalle Valo <kvalo@qca.qualcomm.com> wrote:
>> Michal Kazior <michal.kazior@tieto.com> writes:
>>
>>> Did you skip board file intentionally?
>>
>> Yes, because my understanding is that the board file is not tied to any
>> particular firmware version. The board file should be specific to the
>> hardware configuration in use, or at least that's how it is with ath6kl.
>
> But the board file is not loaded at all for API 2. The api_1 variant
> requests 3 files and can result with up to 3 binaries loaded. api_n
> requests 1 file and can result with up to 2 binaries loaded.

Oops, that's clearly a bug. How did it even pass my tests without the
board file? I'll send v2 to fix that.

So my idea is that with API 2 we load only firmware-2.bin and board.bin
from user space. With API 1 we continue loading firmware.bin, otp.bin
(optional) and board.bin, just as before. And firmware-2.bin can contain
the old firmware.bin (mandatory) and otp.bin (optional) images.

I just realised that I'm missing a check that there really is a firmware
image inside firmware-2.bin, need to add that as well.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
