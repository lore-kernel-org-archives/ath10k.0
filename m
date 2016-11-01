Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-yb0-x231.google.com ([2607:f8b0:4002:c09::231])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c1dYE-0006NV-6G
 for ath10k@lists.infradead.org; Tue, 01 Nov 2016 18:12:47 +0000
Received: by mail-yb0-x231.google.com with SMTP id o7so19819277ybb.0
 for <ath10k@lists.infradead.org>; Tue, 01 Nov 2016 11:12:24 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <4ab2ca16-37ac-7cb2-fa2f-1c7e5eb7e3b8@candelatech.com>
References: <9af68587-603e-2fa9-5ce9-1dc373238b71@candelatech.com>
 <CA+BoTQkxsrGsGTOzxrNvmTOrdOqL1STG4i1ke0Lei6gMP5VZwA@mail.gmail.com>
 <4ab2ca16-37ac-7cb2-fa2f-1c7e5eb7e3b8@candelatech.com>
From: Adrian Chadd <adrian@freebsd.org>
Date: Tue, 1 Nov 2016 11:12:23 -0700
Message-ID: <CAJ-Vmo=K3xS7D27TC+VFjEse4sj2DjJvfH_ScrDfYRpOgBz4gA@mail.gmail.com>
Subject: Re: Question on 10.4 firmware and fetch-indication logic.
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
To: Ben Greear <greearb@candelatech.com>
Cc: Michal Kazior <michal.kazior@tieto.com>, ath10k <ath10k@lists.infradead.org>

On 1 November 2016 at 11:04, Ben Greear <greearb@candelatech.com> wrote:

>
> I do not know the code well around the fetch-ind logic:  This is how the
> firmware tells the driver that it has fully transmitted a frame and is
> reporting
> tx status?  Can it be anything else?

Isn't this the newish stuff added so per-peer queues can be managed and drained?




-adrian

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
