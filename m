Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XJzpn-00023L-JJ
 for ath10k@lists.infradead.org; Wed, 20 Aug 2014 06:57:28 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v7 2/8] ath10k: provide firmware crash info via debugfs
References: <20140819082038.16842.46876.stgit@potku.adurom.net>
 <20140819082253.16842.32433.stgit@potku.adurom.net>
 <CA+BoTQn2aq5EV4mvTs3Ww4i9gAJsmMM5iDfrFd=YfC0YxMi2WQ@mail.gmail.com>
 <53F36C63.8040809@candelatech.com>
 <CA+BoTQ=ocpY2BDCGhMB7E9s4ykp18uXHMTc7rOn0qb7mDyZ5qw@mail.gmail.com>
 <87bnrf7j28.fsf@kamboji.qca.qualcomm.com>
Date: Wed, 20 Aug 2014 09:56:36 +0300
In-Reply-To: <87bnrf7j28.fsf@kamboji.qca.qualcomm.com> (Kalle Valo's message
 of "Wed, 20 Aug 2014 09:48:31 +0300")
Message-ID: <877g237ior.fsf@kamboji.qca.qualcomm.com>
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

Kalle Valo <kvalo@qca.qualcomm.com> writes:

>> Since this is just debugfs then I imagine you could have a userspace
>> program that would create the single blob/crash report from things it
>> thinks is important, e.g.. `uname -a`, debugfs entries (fw stack
>> traces, dbglog, etc), recent kernel log buffer, etc. It could even all
>> be stored in plaintext (with binary data encoded as a hexdump). But
>> that, I guess, could be cumbersome, at least initially, until all
>> major distros adapt.
>
> Sure, we can push lots of this to user space. But what's the point?
>
> With the current approach we get a self-contained crash dump which the
> user (be it a real person or automated) can store with a simple file
> copy operatation and can be easily post-processed afterwards. What you
> propose is a lot of work for everyone, most likely even more bugs and
> without any clear benefits. At least the memory consumption should be
> the same (if not even increase due to increased complexity).

I forgot to mention that also I would not want to rely on debugfs except
at the moment to deliver the dump to user space. I'm hoping that we
would get a generic firmware crash dump support to cfg80211 (hopefully
we can talk about that in Dusseldorf) and we might switch to ethtool or
some another user space interface. Then it might be possible to enable
this even without debugfs, if we are happy to take the hit on memory
use.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
