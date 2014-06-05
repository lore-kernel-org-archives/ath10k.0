Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WsVvJ-0001hX-Je
 for ath10k@lists.infradead.org; Thu, 05 Jun 2014 11:33:34 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [RFC 1/4] ath10k: provide firmware crash info via debugfs.
References: <1401812719-25061-1-git-send-email-greearb@candelatech.com>
 <CA+BoTQnvAzCHvKwib39dOZnN6SEyNG_=U9Jgx5arM819dUoMYw@mail.gmail.com>
Date: Thu, 5 Jun 2014 14:33:06 +0300
In-Reply-To: <CA+BoTQnvAzCHvKwib39dOZnN6SEyNG_=U9Jgx5arM819dUoMYw@mail.gmail.com>
 (Michal Kazior's message of "Wed, 4 Jun 2014 11:04:57 +0200")
Message-ID: <87y4xboakt.fsf@kamboji.qca.qualcomm.com>
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
Cc: Ben Greear <greearb@candelatech.com>, linux-wireless <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Michal Kazior <michal.kazior@tieto.com> writes:

>> +               dbufp = dbuf.next;
>> +               if (dbufp == dbg_hdr.dbuf) {
>> +                       /* It is a circular buffer it seems, bail if next
>> +                        * is head
>> +                        */
>
> Hmm, we seem to be mixing comment styles in ath10k now I guess (this
> applies to other instances of multi-line comments in your patch). What
> multi-line comment style should we really be using in ath10k? Kalle?

Yeah, checkpatch is really annoying here and started to use that
different style of multiline comments. I just disabled that check on my
own setup. Personally I don't really care, but I guess we should switch
to use this "new" style.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
