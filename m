Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-yh0-f52.google.com ([209.85.213.52])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WQFoO-0000uV-0Z
 for ath10k@lists.infradead.org; Wed, 19 Mar 2014 12:41:37 +0000
Received: by mail-yh0-f52.google.com with SMTP id c41so8371177yho.11
 for <ath10k@lists.infradead.org>; Wed, 19 Mar 2014 05:41:11 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CA+BoTQmaxQj+Bv_dQz-+UmrG+7rmz_pTAZAGLY9_Mi_k7JP6HA@mail.gmail.com>
References: <20140313082431.10798.10888.stgit@potku.adurom.net>
 <87pplih81g.fsf@kamboji.qca.qualcomm.com>
 <CA+BoTQmaxQj+Bv_dQz-+UmrG+7rmz_pTAZAGLY9_Mi_k7JP6HA@mail.gmail.com>
Date: Wed, 19 Mar 2014 14:41:11 +0200
Message-ID: <CANe27jJgu7QP9r7GGvnDnDp=7aVmMaJLGPqJVPRyo-E8epYACA@mail.gmail.com>
Subject: Re: [PATCH v2] ath10k: add soft/hard firmware crash option to
 simulate_fw_crash
From: Jouni Malinen <jkmalinen@gmail.com>
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
Cc: Kalle Valo <kvalo@qca.qualcomm.com>, linux-wireless <linux-wireless@vger.kernel.org>, Dan Carpenter <dan.carpenter@oracle.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On Wed, Mar 19, 2014 at 11:16 AM, Michal Kazior <michal.kazior@tieto.com> wrote:
>
> On 19 March 2014 10:06, Kalle Valo <kvalo@qca.qualcomm.com> wrote:
> > Fengguan's buildbot got warnings here and I assume they are coming from
> > smatch:
> >
> > drivers/net/wireless/ath/ath10k/debug.c:500 ath10k_write_simulate_fw_crash() error: strncmp() '"hard"' too small (5 vs 32)
> > drivers/net/wireless/ath/ath10k/debug.c:497 ath10k_write_simulate_fw_crash() error: strncmp() '"soft"' too small (5 vs 32)
> >
> > I wanted to use strncmp() instead of strcmp(), but I'm not sure what to
> > do here. In my opinion it's guaranteed that the string "hard" is null
> > terminated, so it shouldn't matter even if strlen("soft") (5) is less
> > than sizeof(buf) (32), right? Or am I missing something here?
>
> Hmm.. strncmp() compares *at most* n chars. The above means you can
> overflow the const char[] "hard" and "soft" if `buf` is longer than
> those. strncmp() must be passed the smallest length of either
> argument.

No you cannot. strncmp() will stop at '\0' from either buffer. If buf
is nul terminated, I see no point in using strncmp here (i.e., strcmp
should be used instead). If buf is not nul terminated, the length to
strncmp() must be the correct length of data in that buf, not
sizeof(buf). In either case, the current version here is incorrect
(even if it could not result in a buffer read overflow in practice).

- Jouni

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
