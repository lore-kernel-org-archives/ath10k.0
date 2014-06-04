Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WsEjL-0001AA-G2
 for ath10k@lists.infradead.org; Wed, 04 Jun 2014 17:12:03 +0000
Message-ID: <538F533A.3050808@candelatech.com>
Date: Wed, 04 Jun 2014 10:11:22 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: [RFC 1/4] ath10k: provide firmware crash info via debugfs.
References: <1401812719-25061-1-git-send-email-greearb@candelatech.com>
 <CA+BoTQnvAzCHvKwib39dOZnN6SEyNG_=U9Jgx5arM819dUoMYw@mail.gmail.com>
In-Reply-To: <CA+BoTQnvAzCHvKwib39dOZnN6SEyNG_=U9Jgx5arM819dUoMYw@mail.gmail.com>
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

On 06/04/2014 02:04 AM, Michal Kazior wrote:

>> +               if (dbufp == dbg_hdr.dbuf) {
>> +                       /* It is a circular buffer it seems, bail if next
>> +                        * is head
>> +                        */
> 
> Hmm, we seem to be mixing comment styles in ath10k now I guess (this
> applies to other instances of multi-line comments in your patch). What
> multi-line comment style should we really be using in ath10k? Kalle?

Check-patch bitches if you do it differently than what is above, so I say
we keep it as I have it.  Not worth cleaning up other comments to match
unless someone actually cares enough to do it...

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
