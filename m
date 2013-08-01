Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-bk0-x231.google.com ([2a00:1450:4008:c01::231])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V4oxs-0001fo-1M
 for ath10k@lists.infradead.org; Thu, 01 Aug 2013 09:14:32 +0000
Received: by mail-bk0-f49.google.com with SMTP id r7so574123bkg.8
 for <ath10k@lists.infradead.org>; Thu, 01 Aug 2013 02:14:07 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1375342845.8608.8.camel@jlt4.sipsolutions.net>
References: <1375087158-22077-1-git-send-email-michal.kazior@tieto.com>
 <1375087158-22077-2-git-send-email-michal.kazior@tieto.com>
 <1375342845.8608.8.camel@jlt4.sipsolutions.net>
Date: Thu, 1 Aug 2013 11:14:07 +0200
Message-ID: <CA+BoTQm+rWRRpp6XQ_-YHMBfH0Q4ecZ3z-6TV3cvFZ=8uXWsQA@mail.gmail.com>
Subject: Re: [RFC 1/3] nl/cfg80211: add chan_time for scan request
From: Michal Kazior <michal.kazior@tieto.com>
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

On 1 August 2013 09:40, Johannes Berg <johannes@sipsolutions.net> wrote:
> On Mon, 2013-07-29 at 10:39 +0200, Michal Kazior wrote:
>
>> + * @NL80211_ATTR_SCAN_CHAN_TIME: Specifies how many msec should a drive=
r spend
>> + *   on each channel during scanning. This is optional and the default =
is
>> + *   leave the decision up to the driver. This setting may, but preferr=
ably
>
> typo: preferably :)
>
>> + *   shouldn't, be ignored by driver.
>
> This seems a bit iffy - you don't differentiate between active/passive
> scans?

Is there a reason this should be differentiated?


> Also maybe there should be a bit saying "I support scan timing" or even
> the min/max times?

Sounds good. I can add it.


> This also interferes a bit with some other scan optimisations that could
> be done at a low firmware level, so I think we should be careful and
> actually say that this is really more intended for measurement use cases
> and not for normal scans?
>
> Or maybe we should have a separate measurement command with similar
> semantics? This all doesn't seem very clear to me yet :)

Motivation behind this patchset is to simplify ACS implementation and
depend on scan. This also allows easier fallback from survey-based ACS
to BSS-based one.

Other use cases are a side-effect so perhaps clarifying the intent in
the docs is enough.


Pozdrawiam / Best regards,
Micha=B3 Kazior.

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
