Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wr0-x233.google.com ([2a00:1450:400c:c0c::233])
 by merlin.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dBju3-0004gT-7L
 for ath10k@lists.infradead.org; Fri, 19 May 2017 15:33:20 +0000
Received: by mail-wr0-x233.google.com with SMTP id l50so19344282wrc.3
 for <ath10k@lists.infradead.org>; Fri, 19 May 2017 08:32:57 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <87wp9durwe.fsf@kamboji.qca.qualcomm.com>
References: <1493217698-22451-1-git-send-email-c_vnaral@qti.qualcomm.com>
 <40f2b7a2-7276-6de6-afc6-407348c92e70@nbd.name>
 <87wp9durwe.fsf@kamboji.qca.qualcomm.com>
From: Adrian Chadd <adrian@freebsd.org>
Date: Fri, 19 May 2017 08:32:54 -0700
Message-ID: <CAJ-Vmok6UXVpYfK5c_tDnFGN1uLfx+sGp0W2zFppB=TYtax72g@mail.gmail.com>
Subject: Re: [PATCH] ath10k : Fix channel survey dump
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
Cc: Venkateswara Naralasettty <vnaralas@qti.qualcomm.com>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, "nbd@nbd.name" <nbd@nbd.name>

On 19 May 2017 at 02:17, Kalle Valo <kvalo@qca.qualcomm.com> wrote:
> Felix Fietkau <nbd@nbd.name> writes:
>
>> On 2017-04-26 16:41, Venkateswara Rao Naralasetty wrote:
>>> Channel active/busy time are showing incorrect
>>> (less than previous or sometimes zero) for
>>> successive survey dump command.

[snip]

>> Does the firmware read the registers directly, or does it accumulate
>> the results in a way that can't overflow? If you don't clear the
>> counters on reset, the overflow will be problematic for the
>> current-channel stats. I think a better approach would be to use
>> READ_CLEAR for in-use channels and store the sum inside the driver.
>
> Venkateswara, any comments?

I just bumped into this at work. I'm thinking of teaching mac80211
about optionally summing things so each driver doesn't need another
per-channel array.



-adrian

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
