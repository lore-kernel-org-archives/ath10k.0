Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XWjmm-0008GX-5n
 for ath10k@lists.infradead.org; Wed, 24 Sep 2014 10:27:01 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v2 1/3] ath10k: don't enable interrupts for the diagnostic
 window
References: <20140923143219.23585.34114.stgit@potku.adurom.net>
 <CA+BoTQ=P2mKLbdPTQYM_c-ohMtsucTHbc_aukzqcdpQUwhwtvQ@mail.gmail.com>
Date: Wed, 24 Sep 2014 13:26:18 +0300
In-Reply-To: <CA+BoTQ=P2mKLbdPTQYM_c-ohMtsucTHbc_aukzqcdpQUwhwtvQ@mail.gmail.com>
 (Michal Kazior's message of "Wed, 24 Sep 2014 08:58:56 +0200")
Message-ID: <87d2al9uwl.fsf@kamboji.qca.qualcomm.com>
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
Cc: linux-wireless <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Michal Kazior <michal.kazior@tieto.com> writes:

> On 23 September 2014 16:32, Kalle Valo <kvalo@qca.qualcomm.com> wrote:
> [...]
>> -       for (ce_id = 0; ce_id < CE_COUNT; ce_id++)
>> +       /* Skip the last copy engine, CE7 the diagnostic window, as that
>> +        * uses polling and isn't initialized for interrupts. */
>
> Comment style :-)

Argh, I never learn. This new comment style is so unnatural for me that
I guess I need to completely convert ath10k to use the new style so that
I can use checkpatch to catch these :)

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
