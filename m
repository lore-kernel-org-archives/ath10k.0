Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ed1-x543.google.com ([2a00:1450:4864:20::543])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gs9aj-0002c8-1R
 for ath10k@lists.infradead.org; Fri, 08 Feb 2019 17:05:44 +0000
Received: by mail-ed1-x543.google.com with SMTP id g4so3382595eds.4
 for <ath10k@lists.infradead.org>; Fri, 08 Feb 2019 09:05:28 -0800 (PST)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com.
 [209.85.208.41])
 by smtp.gmail.com with ESMTPSA id c12sm731174edi.52.2019.02.08.09.05.24
 for <ath10k@lists.infradead.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 08 Feb 2019 09:05:25 -0800 (PST)
Received: by mail-ed1-f41.google.com with SMTP id o10so3328519edt.13
 for <ath10k@lists.infradead.org>; Fri, 08 Feb 2019 09:05:24 -0800 (PST)
MIME-Version: 1.0
References: <1542163848-837-1-git-send-email-wgong@codeaurora.org>
 <20181115002836.GA71934@google.com>
 <c94346b26a6d4b11a045a176ca854051@aptaiexm02f.ap.qualcomm.com>
 <20181115184333.GA87504@google.com> <87va4x8q2c.fsf@codeaurora.org>
 <CABvG-CVAnwkiKVJik0PdsmRxF62kKv2N+aRKNq=nbopoExLvDA@mail.gmail.com>
 <87y36q75wr.fsf@kamboji.qca.qualcomm.com>
In-Reply-To: <87y36q75wr.fsf@kamboji.qca.qualcomm.com>
From: Brian Norris <briannorris@chromium.org>
Date: Fri, 8 Feb 2019 09:05:11 -0800
Message-ID: <CA+ASDXO8NujrORVLZMPbDy916cnzOvx_Bp8Vr-VvkbBwJvB97A@mail.gmail.com>
Subject: Re: [PATCH] ath10k: support PCIe enter L1 state
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
To: Kalle Valo <kvalo@codeaurora.org>
Cc: linux-wireless <linux-wireless@vger.kernel.org>, =?UTF-8?Q?Micha=C5=82_Kazior?= <kazikcz@gmail.com>, Wen Gong <wgong@qti.qualcomm.com>, ath10k@lists.infradead.org, Wen Gong <wgong@codeaurora.org>

On Fri, Feb 8, 2019 at 5:42 AM Kalle Valo <kvalo@codeaurora.org> wrote:
> No replies from anyone (including Wen) for 3 months about testing this
> patch on anything else than QCA6174. So I'll drop this now, please
> resubmit once test coverage is better.

I know this isn't exactly what you're asking for, but FWIW we've been
using this since late November on all our QCA6174 products. No issues
seen as far as I know, and we have seen some power savings.

Regards,
Brian

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
